{{
  config(
    materialized='table'
  )
}}

SELECT
  order_id,
  SUM(amount) AS order_total_adjustment
FROM {{ ref('stg_order_adjustments') }}
WHERE status='delivered'
GROUP BY 1