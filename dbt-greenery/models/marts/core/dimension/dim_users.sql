{{
  config(
    materialized='table'
  )
}}

SELECT
  u.user_id,
  u.email,
  u.first_name,
  u.last_name,
  u.birth_date,
  u.status,
    u.registered_at_utc,
  DATE(u.registered_at_utc) AS registered_date,
  u.referred_by_user_id IS NOT NULL AS is_referral,
  pc.promo_code_id AS invite_promo_code
FROM {{ ref('int_users_standards') }} u
LEFT JOIN {{ ref('stg_promo_codes') }} pc
  ON u.invite_promo_code_id = pc.promo_code_id