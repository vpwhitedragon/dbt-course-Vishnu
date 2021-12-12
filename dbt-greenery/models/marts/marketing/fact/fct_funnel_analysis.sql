{{
    config(
        materialized='table'
    )
}}

with stage_0 as (
select
count(*) as CNT ,
'stage_0' as stage,
'default' as event_type,
'1' as Key_col
from 
{{ref('stg_events')}}),

stage_1 as (
    select count(*) as CNT,
    'stage_1' as stage,
    'page_view,add_to_cart,checkout' as event_type,
    '1' as Key_col
    from 
    {{ref('stg_events')}}
    where 
    event_type in ('page_view','add_to_cart','checkout')
),


stage_2 as (
    select count(*) as CNT,
    'stage_2' as stage,
    'add_to_cart,checkout' as event_type,
    '1' as Key_col
    from 
    {{ref('stg_events')}}
    where 
    event_type in ('add_to_cart','checkout')
),

stage_3 as (
    select count(*) as CNT ,
    'stage_3' as stage,
    'checkout' as event_type,
    '1' as Key_col
    from 
    {{ref('stg_events')}}
    where 
    event_type in ('checkout')
)



select
    * from 
    stage_0
UNIon ALL
select
    * from 
    stage_1
    UNIon ALL
select
    * from 
    stage_2
UNIon ALL
select
    * from 
    stage_3