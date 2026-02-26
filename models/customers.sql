with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

customer_orders as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        count(orders.order_id) as number_of_orders
    from customers
    left join orders
        on customers.customer_id = orders.customer_id
    group by 1,2,3

)

select * from customer_orders;
