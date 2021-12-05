{{
    config(
        materialized='view' )
}}

SELECT 
    status,
    {{ nulls_check('task_order_cost') }}  as task_order_cost ,
    {{nulls_check('instruction_set_cost')}} as instruction_set_cost ,
    {{ nulls_check('leverage_cost') }}  as leverage_cost ,
    {{ nulls_check('Optional_cost' )}}   as Optional_cost,
    {{ nulls_check('Mandatory_cost') }}  as Mandatory_cost,
    {{ nulls_check('Digitized_cost') }} as Digitized_cost,
    {{ nulls_check('total_order_cost') }} as total_order_cost
FROM
{{ref("fct_promo_status")}} 




