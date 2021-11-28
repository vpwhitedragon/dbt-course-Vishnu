{{
    config(
        materialized='table'
    )
}}


SELECT
order_id,
user_id,
promo_id,
order_cost as amount,
status
from 
{{source('tutorial','orders')}}