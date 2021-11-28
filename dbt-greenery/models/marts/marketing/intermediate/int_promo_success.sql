{{
    config(
        materialized='table'
    )
    }}

    select
        orders.promo_id,
        promos.discount,
        promos.status,
        sum(orders.order_cost)
    FROM
    {{ref('stg_orders')}} orders
    left join  {{ref('stg_promo')}} promos on promos.promo_id=orders.promo_id
    where 
    orders.promo_id is not null
        group by
            orders.promo_id,
            promos.discount,
            promos.status