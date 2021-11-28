SELECT
order_id,
user_id,
order_cost
FROM
{{ref('stg_orders')}}
where 
order_cost=0