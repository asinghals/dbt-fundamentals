with 
payments as (
    select orderid,sum(amount) as order_amount from {{ ref('stg_payments') }}
    group by orderid
    ),

orders as (
    select order_id,customer_id from {{ ref('stg_orders') }}
),

final as (
        select * 
        from  orders
        left join payments 
        on orders.order_id=payments.orderid
) 

select  * from final