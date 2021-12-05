{{
    config(
        materialized='table'
    )
}}


SELECT
    prd.name,
    sum(Case when evn.event_type='add_to_cart' then 1 else 0 end) as product_count,
    (cast(sum(Case when evn.event_type='add_to_cart' then 1 else 0 end) as float)
        /(SELECT cast(count(DISTINCT session_id) as float) from {{ref("stg_events")}}))*100 as product_ratio
FROM 
{{ref("stg_events")}} evn
    left join {{ref("stg_products")}} as prd 
        on prd.product_id=split_part(evn.page_url,'/',5) 
where     
    evn.session_id in (SELECT DISTINCT session_id from {{ref("stg_events")}} events where events.event_type='checkout' )
group by 1