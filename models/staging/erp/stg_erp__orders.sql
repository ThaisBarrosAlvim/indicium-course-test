with
    renamed as (
        select
            cast(id as int) pk_order
            , cast(employeeid as int) as fk_employee
            , cast(customerid as string) as fk_custumer
            , cast(shipvia as int) as fk_shipper
            , cast(id as int) number_order
            , cast(orderdate as date) as date_order
            , cast(shippeddate as date) as date_shipped
            , cast(requireddate as date) as date_required
            , cast(freight as numeric) as freight
            , cast(shipname as string) as name_ship
            , cast(shipcity as string) as city_ship
            , cast(shipregion as string) as region_ship
            , cast(shipcountry as string) as country_ship
        from {{ source('erp', 'orders') }}
            )

select *
from renamed