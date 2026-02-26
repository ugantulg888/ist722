with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

order_payments as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        sum(payments.amount) as total_amount
    from orders
    left join payments
        on orders.order_id = payments.order_id
    group by 1,2,3,4

)

select * from order_payments;
