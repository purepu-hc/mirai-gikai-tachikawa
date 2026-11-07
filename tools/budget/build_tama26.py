import openpyxl, json
def load(f):
    ws=openpyxl.load_workbook(f,read_only=True,data_only=True).active
    return {r[14]:r for r in ws.iter_rows(values_only=True) if r[14] and str(r[14]).startswith('132')}
n=lambda v: 0 if v in (None,'-','－','') else v
G=load('raw/gaikyo.xlsx'); M=load('raw/mokuteki.xlsx')
KAN=[('議会費',[16],[]),
 ('総務費',[17],[(18,'総務管理費'),(19,'徴税費'),(20,'戸籍住民基本台帳費'),(21,'選挙費'),(22,'統計調査費'),(23,'監査委員費')]),
 ('民生費',[24],[(25,'社会福祉費'),(26,'老人福祉費'),(27,'児童福祉費'),(28,'生活保護費'),(29,'災害救助費')]),
 ('衛生費',[30],[(31,'保健衛生費'),(32,'結核対策費'),(33,'保健所費'),(34,'清掃費')]),
 ('労働費',[35,36],[]),
 ('農林水産業費',[37],[(38,'農業費'),(39,'畜産業費'),(40,'農地費'),(41,'林業費'),(42,'水産業費')]),
 ('商工費',[43],[]),
 ('土木費',[44],[(45,'土木管理費'),(46,'道路橋りょう費'),(47,'河川費'),(48,'港湾費'),(49,'都市計画費のうち街路費'),(50,'都市計画費のうち公園費'),(51,'都市計画費のうち下水道費'),(52,'都市計画費のうち区画整理費等'),(54,'住宅費'),(55,'空港費')]),
 ('消防費',[56],[]),
 ('教育費',[57],[(58,'教育総務費'),(59,'小学校費'),(60,'中学校費'),(61,'高等学校費'),(62,'特別支援学校費'),(63,'幼稚園費'),(64,'社会教育費'),(65,'体育施設費等'),(66,'学校給食費'),(67,'大学費')]),
 ('災害復旧費',[68],[(69,'農林水産施設'),(76,'公共土木施設'),(86,'公立学校'),(87,'公営住宅'),(88,'社会福祉施設'),(89,'その他')]),
 ('公債費',[90],[]),
 ('諸支出金',[91,92,93],[]),('前年度繰上充用金',[94],[])]
err=0; cities=[]
for code in sorted(G):
    g,m=G[code],M[code]; kan={}
    for name,cols,sub in KAN:
        amt=sum(n(m[c]) for c in cols)
        subs=[(lab,n(m[c])) for c,lab in sub]
        if sub and sum(v for _,v in subs)!=amt: print('内訳不一致',g[15],name); err+=1
        kan[name]={'amt':amt,'sub':dict(subs)}
    if n(m[85])!=sum(n(m[c]) for c in (86,87,88,89)): print('災害その他不一致',g[15]); err+=1
    if sum(k['amt'] for k in kan.values())!=g[40]: print('総額不一致',g[15]); err+=1
    cities.append({'code':code,'name':g[15],'pop':g[16],'area':g[23],'zaiseiryoku':g[34],'keijo':g[29],'total':g[40],'kan':kan})
print('errors',err,len(cities))
old=json.load(open('tama26_r6.json'))
json.dump({'meta':old['meta'],'kan_order':[k for k,_,_ in KAN][:12],'cities':cities},open('tama26_r6_v2.json','w'),ensure_ascii=False)
