/*  
    This test ensures that the 2012 gross sales are correct 
    with the audited accounting value: R$ 230,784.68
*/

with
    sales_in_2012 as (
        select sum(gross_total) as total_gross_sales
        from {{ ref('int_sales__sales_metrics') }}
        where date_order between '2012-01-01' and '2012-12-31'
    )

select total_gross_sales
from sales_in_2012
where total_gross_sales not between 230784.00 and 230785.00