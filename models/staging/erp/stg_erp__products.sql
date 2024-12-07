with

    renamed as (

        select

            cast(ID as int) as pk_product
            , cast(SUPPLIERID as int) as fk_supplier 
            , cast(CATEGORYID as int) as fk_category
            , cast(PRODUCTNAME as string) as name_product
            , cast(QUANTITYPERUNIT as string) as qtd_per_unit
            , cast(UNITPRICE as numeric(18,2)) as price_per_unit
            , cast(UNITSINSTOCK as int) as unity_in_stock
            , cast(UNITSONORDER as int) as unity_on_order
            , cast(REORDERLEVEL as int) as reorder_level
            , discontinued as is_discontinued

        from {{ source('erp', 'products') }}

    )

select *

from renamed