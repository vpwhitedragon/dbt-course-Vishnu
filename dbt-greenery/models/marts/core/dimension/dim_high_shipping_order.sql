{{
    config(
        materialized='table'
    )
}}

select
    * 
    FROM
    {{ref("int_shipping_cost")}}
    where
    cost_analysis='high'