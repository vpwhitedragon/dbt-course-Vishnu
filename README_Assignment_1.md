1)
SQL: 
SELECT 	COUNT(*) AS NO_USERS FROM "dbt"."dbt_Vishnu_KP"."users";

Answer : 130

2) 
SQL:
Select avg(cnt) as avg_order from (select count(*) as cnt , extract(hour from created_At) as hours from "dbt"."dbt_Vishnu_KP"."orders" group by 2 order by 2 ) as Hours_order

Answer : 16

3)
SQL:
SELECT AVG(DELIVERY_TIME) AS AVG_DELIVERY FROM ( SELECT CREATED_AT, DELIVERED_AT, AGE(DELIVERED_AT, CREATED_AT) AS DELIVERY_TIME FROM "dbt"."dbt_Vishnu_KP"."orders" WHERE STATUS='delivered' ) DELIVERY 

Answer : 3 days 22:13:10.504451

4)
SQL:
select count(*), users_stat from (select case when count(order_id) > 2 then '3 or more order' when count(order_id)=2 then 'exactly 2 order' when count(order_id)=1 then 'Exactly 1 order' end as users_Stat ,user_id from "dbt"."dbt_Vishnu_KP"."orders" group by user_id order by 1 desc) cnt group by cnt.users_stat;

Answer :

 count |   users_stat    
-------+-----------------
    81 | 3 or more order
    25 | Exactly 1 order
    22 | exactly 2 order

5)  
SQL:
select avg(cnt) from (select count(distinct session_id) as cnt , extract(hour from created_At),date(created_at) as hours from "dbt"."dbt_Vishnu_KP"."events" where date(created_at) is not null  group by 2,date(created_at) order by 2) cnt;

Answer : 7.27 
