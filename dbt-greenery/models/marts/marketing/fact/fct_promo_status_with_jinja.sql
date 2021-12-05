{{
    config(
        materialized='table' )
}}

{% set promo_types=["task-force","instruction","leverage","Optional","Mandatory","Digitized"] %}

SELECT 
    status,
    {% for promo_type in promo_types %}
    SUM(case when promo_id='{{promo_type}}'   then   order_cost END) as {{promo_type.replace('-','_')}}_cost ,
    {% endfor %}
    sum(order_cost) as total_order_cost
FROM
{{ref("stg_orders")}} 
group by 1

