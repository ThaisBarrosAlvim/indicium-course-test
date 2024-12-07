with

    source_suppliers as (

        select
            cast(id as int) as pk_supplier
            , cast(companyname as varchar) as name_supplier
            , cast(city as varchar) as city_supplier
            , cast(country as varchar) as country_supplier

        from {{ source("erp", "suppliers") }}

    )

select *

from source_suppliers
