{{
  config(
    materialized='table'
  )
}}

SELECT
  o.order_id,
  evnt.page_url as order_placed_at,
  o.order_total,
  o.status as order_status,
  o.promo_id as promo_code_id,
    pc.discount AS promo_code_discount,
  o.user_id,
  u.first_name AS user_first_name,
  o.tracking_id as shipment_id,
  s.status AS shipment_status,
    oa.order_id IS NOT NULL AS has_adjustment
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_promo') }} pc
  ON o.promo_id = pc.promo_id
LEFT JOIN {{ ref('stg_users') }} u
  ON o.user_id = u.user_id
LEFT JOIN {{ ref('stg_shipments') }} s
  ON o.tracking_id = s.shipment_id
LEFT JOIN {{ ref('stg_order_adjustments') }} oa
  ON o.order_id = oa.order_id
  LEFT JOIN{{ ref('stg_events')}} evnt 
  on o.user_id=evnt.user_id