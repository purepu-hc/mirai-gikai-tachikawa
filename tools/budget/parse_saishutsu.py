"""立川市 一般会計予算 事項別明細書（歳出）から 款・項・目・事業 を取り出す"""
import pdfplumber, re, json, sys
PDF=sys.argv[1]; OUT=sys.argv[2]
num=re.compile(r'^△?[\d,]+$')
def toint(s): 
    s=s.replace(',','').replace('）','').replace(')','')
    neg=s.startswith('△'); s=s.lstrip('△')
    return -int(s) if neg else int(s)
def lines_of(words, tol=3):
    ws=sorted(words,key=lambda w:(w['top'],w['x0'])); out=[]
    for w in ws:
        if out and abs(w['top']-out[-1]['top'])<=tol: out[-1]['ws'].append(w)
        else: out.append({'top':w['top'],'ws':[w]})
    for l in out: l['ws'].sort(key=lambda w:w['x0'])
    return out
pdf=pdfplumber.open(PDF)
rows=[]   # left table rows
jigyo=[]  # right 事業
for i,p in enumerate(pdf.pages):
    ws=p.extract_words(x_tolerance=1.5)
    hdr=[w for w in ws if w['text'] in('款','項','目') and 115<w['top']<125]
    if not hdr: continue
    xs=sorted(w['x0'] for w in hdr)
    if not (80<xs[0]<100): continue   # use only the copy where the spread starts at x≈92
    pg=i+1
    body=[w for w in ws if w['top']>135 and w['top']<800]
    left=[w for w in body if w['x0']<315]
    right=[w for w in body if w['x0']>=600]
    # ---- left table
    for l in lines_of(left):
        t=l['ws']
        nums=[w for w in t if num.match(w['text']) and w['x0']>150]
        cands=[(k,w) for k,w in enumerate(t) if w['x0']<112 and re.match(r'^\d+\D',w['text'])]
        first=cands[-1][1] if cands else t[0]
        if cands: t=t[cands[-1][0]:]
        m=re.match(r'^(\d+)(.*)$',first['text'])
        if cands and nums:
            cend=first['x0']+5.6*len(m.group(1)); lvl='kan' if cend<91 else ('kou' if cend<103 else 'moku')
            name=m.group(2)+''.join(w['text'] for w in t[1:] if w['x0']<160 and not num.match(w['text']))
            rows.append({'lvl':lvl,'code':int(m.group(1)),'name':name,'_top':l['top'],'amt':toint(nums[0]['text']),
                         'prev':toint(nums[1]['text']) if len(nums)>1 else None,'page':pg})
        elif not cands and not nums and rows and rows[-1]['page']==pg and 0<l['top']-rows[-1]['_top']<34 and all(w['x0']<160 for w in t) and t[0]['x0']>=95 and not re.match(r'^\d+$',t[0]['text']):
            rows[-1]['name']+=''.join(w['text'] for w in t); rows[-1]['_top']=l['top']
    # ---- right 説明
    rl=lines_of(right)
    for k,l in enumerate(rl):
        t=l['ws']
        if 605<t[0]['x0']<625 and re.match(r'^\d+$',t[0]['text']):
            txt=''.join(w['text'] for w in t[1:] if w['x0']<960)
            amt=[w for w in t if w['x0']>960 and num.match(w['text'])]
            j=k+1
            # name may wrap until 【課】 appears
            while '】' not in txt and j<len(rl) and not any('特定財源' in w['text'] for w in rl[j]['ws']):
                txt+=''.join(w['text'] for w in rl[j]['ws'] if w['x0']<960); 
                amt+= [w for w in rl[j]['ws'] if w['x0']>960 and num.match(w['text'])]; j+=1
            fin=None
            for jj in range(j,min(j+3,len(rl))):
                s=' '.join(w['text'] for w in rl[jj]['ws'])
                mm=re.search(r'特定財源\s+([\d,]+)\s+一般財源\s+([\d,]+)',s)
                if mm: fin=(toint(mm.group(1)),toint(mm.group(2))); break
            mk=re.match(r'^(.*?)【(.+?)】',txt)
            jigyo.append({'no':int(t[0]['text']),'name':mk.group(1) if mk else txt,'ka':mk.group(2) if mk else None,
                          'amt':toint(amt[0]['text']) if amt else None,'tokutei':fin[0] if fin else None,
                          'ippan':fin[1] if fin else None,'page':pg})
json.dump({'rows':rows,'jigyo':jigyo},open(OUT,'w'),ensure_ascii=False,indent=1)
print(len(rows),'rows',len(jigyo),'jigyo')
