import json,pdfplumber,re
t=json.load(open('r8_tree.json')); d1=json.load(open('r8_dai1hyo.json'))
# 財源内訳 (歳出総括 p18)
p=pdfplumber.open('raw/r8_ippan.pdf').pages[17]
col={368:'kokuto',416:'chihousai',465:'sonota',521:'ippan'}
lines={}
for w in p.extract_words(x_tolerance=1.5): lines.setdefault(round(w['top']/3),[]).append(w)
zaigen={}
for k in sorted(lines):
    tt=sorted(lines[k],key=lambda w:w['x0']); m=re.match(r'^(\d+)\.',tt[0]['text'])
    if not m or int(m.group(1))>12: continue
    z={'kokuto':0,'chihousai':0,'sonota':0,'ippan':0}
    for w in tt:
        if re.match(r'^[\d,]+$',w['text']) and round(w['x1']) in col: z[col[round(w['x1'])]]=int(w['text'].replace(',',''))
    zaigen[int(m.group(1))]=z
err=0
for k in t:
    z=zaigen[k['code']]
    if sum(z.values())!=k['amt']: print('財源内訳不一致',k['name']); err+=1
    k['zaigen']=z
tot={c:sum(zaigen[k][c] for k in zaigen) for c in ['kokuto','chihousai','sonota','ippan']}
print('財源内訳合計',tot)
assert tot=={'kokuto':32293041,'chihousai':720300,'sonota':3601416,'ippan':56891243}
# 予備費: 事業が無いので目そのものを事業として扱う
for k in t:
    for p_ in k['kou']:
        for m in p_['moku']:
            if not m['jigyo']: m['jigyo']=[{'no':1,'name':m['name'],'ka':'財政課','amt':m['amt'],'tokutei':0,'ippan':m['amt'],'page':m['page'],'note':'事業の内訳なし'}]
            for j in m['jigyo']: j.pop('page',None)
            for x in ('_top','lvl'): m.pop(x,None)
        for x in ('_top','lvl','page'): p_.pop(x,None)
    for x in ('_top','lvl','page'): k.pop(x,None)
# 前年度(歳入款)は総括p17から
prev_in={}
p17=pdfplumber.open('raw/r8_ippan.pdf').pages[16]
lines={}
for w in p17.extract_words(x_tolerance=1.5): lines.setdefault(round(w['top']/3),[]).append(w)
for k in sorted(lines):
    tt=sorted(lines[k],key=lambda w:w['x0']); m=re.match(r'^(\d+)\.',tt[0]['text'])
    nums=[int(w['text'].replace(',','').replace('△','-')) for w in tt if re.match(r'^△?[\d,]+$',w['text'])]
    if m and len(nums)>=2: prev_in[int(m.group(1))]=nums[1]
for k in d1['sainyu']: k['prev']=prev_in.get(k['code'])
assert sum(k['prev'] for k in d1['sainyu'])==89750000
data={'meta':{'city':'立川市','fiscal':'令和8年度（2026年度）','kind':'一般会計 当初予算','unit':'千円',
  'total':93506000,'prev_total':89750000,
  'source':'立川市「令和8年度立川市一般会計予算及び事項別明細書」',
  'source_url':'https://www.city.tachikawa.lg.jp/_res/projects/default_project/_page_/001/007/125/r8_ippan.pdf'},
  'sainyu':d1['sainyu'],'saishutsu':t}
json.dump(data,open('r8_data.json','w'),ensure_ascii=False)
nj=sum(len(m['jigyo']) for k in t for p_ in k['kou'] for m in p_['moku'])
print('OK errors',err,'事業',nj)
