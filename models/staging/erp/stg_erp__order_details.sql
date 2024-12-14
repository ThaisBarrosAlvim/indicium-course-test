with
    renamed as (
        select
            orderid::varchar || '-' || productid::varchar as pk_order_details,
            cast(orderid as int) as fk_order,
            cast(productid as int) as fk_product,
            cast(discount as numeric(18, 2)) as discount_perc,
            cast(unitprice as numeric(18, 2)) as price_per_unit,
            cast(quantity as int) as quantity
        from {{ source("erp", "order_details") }}
    )

select *
from renamed
