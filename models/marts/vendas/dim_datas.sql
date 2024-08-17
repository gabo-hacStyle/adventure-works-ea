with int_datasvendas as (
    select combineddate from {{ ref('datas_vendas') }}
),

combineddates as (
    select * from int_datasvendas
    union
    select data_contratacao as combineddate from {{ ref('staging_bd__trabalhadores') }}
)

select distinct TO_CHAR(combineddate, 'YYYYMMDD') as pk_data, combineddate as data from combineddates
