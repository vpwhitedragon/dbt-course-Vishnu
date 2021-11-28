{{
    config(
        materialized='table'
    )
}}

select
users.*,
orders.order_id,
orders.order_cost,
orders.status,
orders.shipping_cost
FROM
{{ref('stg_users')}} as users
left join {{ref("stg_orders")}} orders on orders.user_id=users.user_id