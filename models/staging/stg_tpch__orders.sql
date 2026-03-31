with source as (
    select * from {{ source('tpch_sample', 'orders') }}
),

renamed as (
    select
        O_ORDERKEY as order_id,      -- Standard TPC-H naming is O_ + COLUMN
        O_CUSTKEY as customer_id,
        O_ORDERSTATUS as status_code,
        O_TOTALPRICE as total_amount,
        cast(O_ORDERDATE as date) as order_date
    from source
)

select * from renamed