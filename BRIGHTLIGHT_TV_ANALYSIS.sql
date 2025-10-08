--CREATE A NEW TABLE CALLED USERS SEPARATE FEOM THE RAW DATA
CREATE OR REPLACE TEMP TABLE users AS
SELECT
--used to separate the time and date create a new column for each
CAST(TO_TIMESTAMP(RECORDDATE2, 'YYYY/MM/DD HH24:MI')AS DATE) AS WATCH_DATE,
CAST(TO_TIMESTAMP(RECORDDATE2, 'YYYY/MM/DD HH24:MI')AS TIME) AS WATCH_TIME,
 --provides the day of month from the date provided 
DAYOFMONTH(WATCH_DATE) AS DAY_OF_MONTH,
DAYNAME(WATCH_DATE) AS DAY_OF_THE_WEEK,
MONTHNAME(WATCH_DATE)AS MONTH_NAME,

 --replaces all the null and none values in the gender column
CASE 
when gender='None' THEN 'unknown' 
When gender is Null then 'unknown'
ELSE gender
END AS gender,

 --replaces all the empty, other and none values in the race column with unknown 
 CASE 
when race IN ('other', 'None') THEN 'unknown'
When race is NUll THEN 'unknown'
ELSE race
END AS race,

 --replces all the none and empty values in the province colum with unknown
 CASE 
when province IN ('None') THEN 'unknown'
When province is NUll THEN 'unknown'
ELSE province
END AS province,
 
 --creates time_buckets 
 CASE
WHEN WATCH_TIME BETWEEN '06:00:00' AND '11:59:59' THEN 'MORNING'
WHEN WATCH_TIME BETWEEN '12:00:00' AND '16:59:59' THEN 'AFTERNOON'
WHEN WATCH_TIME BETWEEN '17:00:00' AND '20:59:59' THEN 'EVENING'
ELSE 'NIGHT'
END AS TIME_BUCKETS,

 --create age_buckets
CASE 
WHEN age between 0 AND 29 THEN 'YOUNG'
WHEN age between 30 AND 59 THEN 'ADULT'
WHEN age BETWEEN 60 AND 89 THEN 'ELDER'
ELSE 'SENIOR'
END AS TIME_BUCKET,

--COUNT HOW MANY PEOPLE ARE SIGNED UP
COUNT (DISTINCT EMAIL) AS NUMBER_OF_USERS,
 
--joins bothe the user and veiw tables with the full outer joins
FROM "BRIGHT"."PUBLIC"."VIEW" AS VIEWSHIP
FULL OUTER JOIN  "BRIGHT"."PUBLIC"."USERPROFILE" AS USER
ON VIEWSHIP.userid=user.userid
GROUP BY ALL
;

SELECT * FROM USERS;

