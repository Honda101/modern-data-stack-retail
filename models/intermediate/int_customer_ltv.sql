with orders as (
    select * from {{ ref('stg_tpch__orders') }}
),

customer_totals as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date,
        count(order_id) as total_orders,
        sum(total_amount) as lifetime_spend
    from orders
    group by 1
),

final as (
    select
        customer_id,
        first_order_date,
        last_order_date,
        total_orders,
        lifetime_spend,
        -- Calculate average order value (AOV)
        round(lifetime_spend / nullif(total_orders, 0), 2) as avg_order_value,
        -- Engineering touch: Flag "High Value" customers
        case 
            when lifetime_spend > 500000 then 'Platinum'
            when lifetime_spend > 200000 then 'Gold'
            else 'Standard'
        end as customer_segment
    from customer_totals
)

select * from final