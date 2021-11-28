{{
    config(
        materialized='table'
    )
}}
SELECT
users.created_at as registered_at_utc ,
orders.promo_id as invite_promo_code_id,
users.user_id,
  users.email,
  users.first_name,
  users.last_name,
  '' as birth_date,
  orders.status,
'' as referred_by_user_id
 FROM
 {{ref('stg_users')}} as users 
 left join {{ref("stg_orders")}} orders on orders.user_id=users.user_id