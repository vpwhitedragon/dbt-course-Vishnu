{% snapshot addresses_snapshot %}
{{
    config(
        target_schema='snapshots',
        unique_key='id',
        strategy='check',
        check_cols=['address_id']

    )
}}

SELECT
    * 
FROM {{ source('tutorial','addresses')}}

{% endsnapshot %}