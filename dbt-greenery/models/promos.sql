{{
    config(
        materialized='table'
    )
}}

SELECT
    promo_id,
    discout as discount,
    status
FROM {{ source('tutorial','promos')}}