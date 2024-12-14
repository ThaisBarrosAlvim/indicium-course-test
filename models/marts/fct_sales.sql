with
    fct_sales as (
        select *
        from {{ ref('int_sales__sales_metrics') }}
    )

select *
from fct_sales