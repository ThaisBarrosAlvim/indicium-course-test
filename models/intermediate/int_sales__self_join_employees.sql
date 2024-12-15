with
    employees as (
        select *
        from {{ ref('stg_erp__employees') }}
    )

    , self_joined as (
        select
            employees.PK_EMPLOYEE
            , employees.NAME_EMPLOYEE
            , employees.TITLE_EMPLOYEE
            , managers.NAME_EMPLOYEE as name_manager
            , employees.BIRTHDATE_EMPLOYEE
            , employees.HIREDATE_EMPLOYEE
            , employees.CITY_EMPLOYEE
            , employees.REGION_EMPLOYEE
            , employees.COUNTRY_EMPLOYEE
        from employees
        left join employees as managers
            on employees.fk_manager = managers.pk_employee
    )

select *
from self_joined