{{
    config(
        materialized='table'
         )
}}

SELECT
orders.* ,
evnt.event_type,
evnt.page_url,
evnt.event_id
FROM
{{ref("stg_orders")}} as orders
left join {{ref('stg_events')}} as evnt on orders.user_id=evnt.user_id