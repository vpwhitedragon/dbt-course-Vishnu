{{
    config(
        materialized='table' )
}}

SELECT 
    status,
    SUM(case when promo_id='task-force'    then   order_cost END) as task_order_cost ,
    SUM(case when promo_id='instruction set'    then   order_cost END) as instruction_set_cost ,
    SUM(case when promo_id='leverage'    then   order_cost END) as leverage_cost ,
    SUM(case when promo_id='Optional'    then   order_cost END) as Optional_cost ,
    SUM(case when promo_id='Mandatory'    then   order_cost END) as Mandatory_cost ,
    SUM(case when promo_id='Digitized'    then   order_cost END) as Digitized_cost,
    sum(order_cost) as total_order_cost
FROM
{{ref("stg_orders")}} 
group by 1

