import json,sys
d=json.load(open(sys.argv[1])); rows=d['rows']; J=d['jigyo']
SOUKATSU={1:467825,2:13141162,3:47458233,4:7627147,5:140449,6:143349,7:433872,8:6283470,9:2458030,10:11868580,11:3383883,12:100000}
# build tree
tree=[]; cur_k=cur_p=None
for r in rows:
    if r['lvl']=='kan': cur_k={**r,'kou':[]}; tree.append(cur_k)
    elif r['lvl']=='kou': cur_p={**r,'moku':[]}; cur_k['kou'].append(cur_p)
    else: cur_p['moku'].append({**r,'jigyo':[]})
err=0
print('款数',len(tree),'合計',sum(k['amt'] for k in tree))
for k in tree:
    if SOUKATSU.get(k['code'])!=k['amt']: print('款不一致',k['code'],k['name'],k['amt'],SOUKATSU.get(k['code'])); err+=1
    s=sum(p['amt'] for p in k['kou'])
    if s!=k['amt']: print('項合計不一致',k['name'],s,k['amt']); err+=1
    for p in k['kou']:
        s=sum(m['amt'] for m in p['moku'])
        if s!=p['amt']: print('目合計不一致',k['name'],p['name'],s,p['amt']); err+=1
# assign jigyo to moku in order: numbering restarts per moku
mokus=[m for k in tree for p in k['kou'] for m in p['moku']]
mi=-1; prev=10**9
for j in J:
    if j['no']<=prev: mi+=1
    prev=j['no']
    if mi<len(mokus): mokus[mi]['jigyo'].append(j)
print('目数',len(mokus),'事業の区切り数',mi+1)
for m in mokus:
    s=sum((j['amt'] or 0) for j in m['jigyo'])
    if s!=m['amt']: print('事業合計不一致',m['page'],m['name'],s,m['amt'],len(m['jigyo'])); err+=1
for j in J:
    if j['amt'] is None or j['tokutei'] is None or j['tokutei']+j['ippan']!=j['amt']:
        print('事業内訳不一致',j); err+=1
print('ERRORS',err)
json.dump(tree,open(sys.argv[1].replace('_parsed','_tree'),'w'),ensure_ascii=False,indent=1)
