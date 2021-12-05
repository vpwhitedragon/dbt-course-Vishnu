{{
    config(
        materialized='table'
    )
}}


SELECT 
        (cast(sum(case when event_type='checkout'then 1 else  0 end) as float)
        / cast(count(*) as float))*100 as CONVERSION_rate
 
 FROM 
 {{ref('stg_events')}}