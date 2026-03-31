with ltv_data as (
    select * from {{ ref('int_customer_ltv') }}
)

select
    customer_segment,
    count(customer_id) as total_customers,
    round(sum(lifetime_spend), 2) as total_revenue,
    round(avg(lifetime_spend), 2) as avg_revenue_per_customer
from ltv_data
group by 1
order by total_revenue desc