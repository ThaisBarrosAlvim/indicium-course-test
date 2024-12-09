with
    employees_source as (
        select *
        from {{ source('erp', 'employees') }}
    )

    , renamed as (
        select
            cast(ID as int) as pk_employee
            , cast(REPORTSTO as int) as fk_manager
            , FIRSTNAME || ' ' || LASTNAME as name_employee
            , cast(TITLE as varchar) as title_employee
            , cast(BIRTHDATE as date) as birthdate_employee
            , cast(HIREDATE as date) as  hiredate_employee
            , cast(CITY as varchar) as city_employee
            , cast(REGION as varchar) as region_employee
            , cast(COUNTRY as varchar) as country_employee
            --, cast(TITLEOFCOURTESY as varchar)
            --, cast(ADDRESS as varchar) 
            --, cast(POSTALCODE as varchar) 
            --, cast(HOMEPHONE as varchar)
            --, cast(EXTENSION as varchar)
            --, cast(PHOTO as varchar)
            --, cast(NOTES as varchar)
            --, cast(PHOTOPATH as varchar)
        from employees_source
    )

select *
from renamed