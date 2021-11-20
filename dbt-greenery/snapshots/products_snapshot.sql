{%  snapshot products_snapshots %}

{{
    config(
        target_schema='snapshots',
        unique_key='id',
        strategy='check',
        check_cols=['product_id']
        )
}}

SELECT
    *
FROM {{ source('tutorial','products')}}

{% endsnapshot %}