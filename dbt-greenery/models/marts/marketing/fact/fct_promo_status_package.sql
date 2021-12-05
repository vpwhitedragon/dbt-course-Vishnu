{{
    config(
        materialized='table'
    )
}}

{% set promo_id_values= dbt_utils.get_column_values(table=ref('stg_promo'),column='promo_id') %}

SELECT 
    status,
    {% for promo_id_value in promo_id_values %}
    SUM(case when promo_id='{{promo_id_value}}'   then   order_cost END) as {{promo_id_value.replace(' ','_').replace('-','_')}}_cost ,    
    {% endfor %}
    sum(order_cost) as total_order_cost
FROM
{{ref("stg_orders")}} 
group by 1