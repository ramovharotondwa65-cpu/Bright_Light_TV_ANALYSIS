--checking each table separately 
select * from brighttv.public.userprofile
LIMIT 10;
---------------------------------------
select *from brighttv.public.viewship
limit 10;
---------------------------------------
select count(distinct USERID)
from brighttv.public.userprofile;
----------------------------------------
select count(distinct CHANNEL2)
FROM BRIGHTTV.PUBLIC.VIEWSHIP;
----------------------------------------
select min(to_date(RECORDDATE2, 'YYYY/MM/DD HH24:MI')) as min_date
from BRIGHTTV.PUBLIC.VIEWSHIP;
----------------------------------------
select max(to_date(RECORDDATE2, 'YYYY/MM/DD HH24:MI')) as min_date
from BRIGHTTV.PUBLIC.VIEWSHIP;
----------------------------------------
select count(distinct PROVINCE)
from brighttv.public.userprofile;
----------------------------------------
select count(distinct RACE)
from brighttv.public.userprofile;
----------------------------------------
select count(distinct GENDER)
from brighttv.public.userprofile;
