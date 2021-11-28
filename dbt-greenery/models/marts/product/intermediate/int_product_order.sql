{{
    config(
        materialized='table'
    )
}}

SELECT
prd.product_id, 
prd.name , 
count(orders.order_id)
FROM
{{ref('stg_products')}} as prd
left join {{ref('stg_order_item')}} orders on orders.product_id=prd.product_id
group by 
prd.product_id, 
prd.name 