with 

source_category as (

    select
        cast(id as int) as pk_category
        , cast(categoryname as string) as name_category
        , cast(description as string) as description_category

    from {{ source('erp', 'category') }}
)


select * from source_category
