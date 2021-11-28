{{
    config(
        materialized='table'
    )
}}

select
count(orders.order_id),
stg_products.name,
stg_address.state,
orders.status
FROM
{{ref('stg_orders')}} as orders 
left join {{ref('stg_order_item')}} stg_order_items on stg_order_items.order_id=orders.order_id
left join {{ref("stg_products")}} stg_products on stg_order_items.product_id=stg_products.product_id
left join {{ref("stg_addresses")}} stg_address on stg_address.address_id=orders.address_id
group  by
stg_products.name,
stg_address.state,
orders.status