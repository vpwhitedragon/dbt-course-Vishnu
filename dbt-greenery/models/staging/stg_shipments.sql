{{
    config(
        materialized='table'
    )
}}

SELECT
order_id,
order_id as shipment_id,
status,
delivered_at as shipment_delivered_at
FROM
{{source('tutorial','orders')}}
