{{
    config(
        materialized='table'
    )
}}

select 
count(*) as Orders_delivered,
shipping_service,
case when estimated_delivery_at > delivered_at then 'early'
when estimated_delivery_at < delivered_at then 'late'
end as del_stat
FROM
{{ ref("stg_orders")}}
where
shipping_service is not null
group by 
shipping_service,
del_stat
order by 1,2
limit 10