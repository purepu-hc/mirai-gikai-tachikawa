import subprocess,re,json
txt=subprocess.run(['pdftotext','-layout','-f','7','-l','11','raw/r8_ippan.pdf','-'],capture_output=True,text=True).stdout
sec=None; out={'sainyu':[],'saishutsu':[]}; pend=None
for line in txt.splitlines():
    s=line.rstrip()
    if re.match(r'^\s*歳\s+入\s*$',s) and '合' not in s: sec='sainyu'; continue
    if re.match(r'^\s*歳\s+出\s*$',s): sec='saishutsu'; continue
    if not sec or '合' in s and '計' in s: continue
    m=re.match(r'^(\s*)(\d+)\.(.*?)\s{2,}([\d,]+)\s*$',s) or re.match(r'^(\s*)(\d+)\.(.*?)()\s*$',s)
    if not m:
        if pend is not None and s.strip() and not re.search(r'[－―]',s):
            mm=re.match(r'^\s*(.*?)\s{2,}([\d,]+)\s*$',s)
            pend['name']+=re.sub(r'\s','',mm.group(1) if mm else s)
            if mm: pend['amt']=int(mm.group(2).replace(',',''))
        continue
    ind=len(m.group(1)); name=re.sub(r'\s','',m.group(3)); amt=int(m.group(4).replace(',','')) if m.group(4) else None
    lvl='kan' if ind<10 else 'kou'
    r={'code':int(m.group(2)),'name':name,'amt':amt}
    if lvl=='kan': r['kou']=[]; out[sec].append(r)
    else: out[sec][-1]['kou'].append(r)
    pend=r
json.dump(out,open('r8_dai1hyo.json','w'),ensure_ascii=False,indent=1)
for sec in out:
    tot=sum(k['amt'] for k in out[sec]); print(sec,len(out[sec]),'款 合計',tot)
    for k in out[sec]:
        s=sum(p['amt'] for p in k['kou'])
        if s!=k['amt']: print('  不一致',k['name'],s,k['amt'])
for k in out['sainyu']: print(k['code'],k['name'],k['amt'],[(p['name'],p['amt']) for p in k['kou']])
