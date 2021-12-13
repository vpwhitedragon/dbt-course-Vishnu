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
    CNT,stage,event_type, 0 as Dropped_Sessions ,
    0 as Dropped_Sessions_rate
    from 
    stage_0
UNIon ALL
select
    stage_1.CNT,stage_1.stage,stage_1.event_type, (stage_0.CNT -stage_1.CNT) as Dropped_Sessions ,
    (cast(stage_0.CNT as float) - cast(stage_1.CNT as float))/cast(stage_0.CNT as float)*100 as Dropped_Sessions_rate
    from 
    stage_1,
    stage_0
    where 
    stage_0.Key_col=stage_1.Key_col
    UNIon ALL
select
    stage_2.CNT,stage_2.stage,stage_2.event_type, 
    (cast(stage_1.CNT as float) -cast(stage_2.CNT as float)) as Dropped_Sessions,
    (cast(stage_1.CNT as float) -cast(stage_2.CNT as float))/cast(stage_1.CNT as float)*100 as Dropped_Sessions_rate
     from 
    stage_2,
    stage_1
    where
    stage_1.Key_col=stage_2.Key_col
UNIon ALL
select
    stage_3.CNT,stage_3.stage,stage_3.event_type, (stage_2.CNT -stage_3.CNT) as Dropped_Sessions,
    (cast(stage_2.CNT as float) -cast(stage_3.CNT as float))/cast(stage_2.CNT as float)*100 as Dropped_Sessions_rate
     from 
    stage_3,
    stage_2
    where
    stage_3.Key_col=stage_2.Key_col
