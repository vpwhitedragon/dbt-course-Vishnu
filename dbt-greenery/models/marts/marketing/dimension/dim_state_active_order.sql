{{
    config(
        materialized='table'
    )
}}
select 
count(orders.order_id),
address.state,
address.country,
orders.status
FROM
{{ref('stg_addresses')}}  address 
left join {{ref('stg_orders')}} orders on orders.address_id=address.address_id and orders.status not in ('delivered') and orders.status is not null
group by
address.state,
address.country,
orders.status