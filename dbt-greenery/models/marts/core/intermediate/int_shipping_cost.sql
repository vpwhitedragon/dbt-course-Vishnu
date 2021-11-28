{{
    config(
        materialized='table'
    )
}}

select 
order_id,
shipping_cost,
order_total,
shipping_service,
status,
case when floor(shipping_cost) > floor(order_Cost) then 'high'
when floor(shipping_cost) < floor(order_Cost) then 'low'
end as cost_analysis 
FROM
{{ref("stg_orders")}}
