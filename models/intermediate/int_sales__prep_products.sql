with 
    category as (
        select *
        from {{ ref('stg_erp__category') }}
    )
    , suppliers as (
        select *
        from {{ ref('stg_erp__suppliers') }}
    )

    , products as (
        select *
        from {{ ref('stg_erp__products') }}
    )

    , enrich_products as (
        select 
            products.PK_PRODUCT
            , products.NAME_PRODUCT
            , products.QTD_PER_UNIT
            , products.PRICE_PER_UNIT
            , products.UNITY_IN_STOCK
            , products.UNITY_ON_ORDER
            , products.REORDER_LEVEL
            , products.IS_DISCONTINUED
            , category.NAME_CATEGORY
            , suppliers.NAME_SUPPLIER
            , suppliers.CITY_SUPPLIER
            , suppliers.COUNTRY_SUPPLIER
        from products
        left join category on products.fk_category = category.pk_category
        left join suppliers on products.fk_supplier = suppliers.pk_supplier
    )
    
select *
from enrich_products
