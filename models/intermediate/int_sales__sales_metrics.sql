with
    orders as (
        select *
        from {{ ref('stg_erp__orders') }}
    )

    , order_details as (
        select *
        from {{ ref('stg_erp__order_details') }}
    )

    , joined as (
        select
            order_details.PK_ORDER_DETAILS
            , order_details.FK_PRODUCT
            , orders.FK_EMPLOYEE
            , orders.FK_CUSTUMER
            , orders.FK_SHIPPER
            , orders.DATE_ORDER
            , orders.DATE_SHIPPED
            , orders.DATE_REQUIRED
            , order_details.DISCOUNT_PERC
            , order_details.PRICE_PER_UNIT
            , order_details.QUANTITY
            , orders.FREIGHT
            , orders.NUMBER_ORDER
            , orders.NAME_SHIP
            , orders.CITY_SHIP
            , orders.REGION_SHIP
            , orders.COUNTRY_SHIP
        from order_details
        inner join orders on order_details.fk_order = orders.pk_order
    )
    
    , metrics as (
        select 
            PK_ORDER_DETAILS
            , FK_PRODUCT
            , FK_EMPLOYEE
            , FK_CUSTUMER
            , FK_SHIPPER
            , DATE_ORDER
            , DATE_SHIPPED
            , DATE_REQUIRED
            , DISCOUNT_PERC
            , PRICE_PER_UNIT
            , QUANTITY
            , FREIGHT
            , PRICE_PER_UNIT * QUANTITY as gross_total
            , PRICE_PER_UNIT * (1 - DISCOUNT_PERC) * QUANTITY as net_total
            , cast((FREIGHT /  count(*) over(partition by number_order)) as numeric(18,2)) as freight_rated
            , case
                when DISCOUNT_PERC > 0 then true
                else false
            end as has_discount
            , NUMBER_ORDER
            , NAME_SHIP
            , CITY_SHIP
            , REGION_SHIP
            , COUNTRY_SHIP
        from joined
    )

select *
from metrics