with
    dim_employees as (
        select *
        from {{ ref('int_sales__self_join_employees') }}
    )

select *
from dim_employees