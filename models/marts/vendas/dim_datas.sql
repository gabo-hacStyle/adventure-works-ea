with int_datasvendas as (
    select combineddate from {{ ref('datas_vendas') }}
),


-- Unimos todas as datas encontradas na intermediaria de datas (para area de vendas)
-- com o outro modelo que contem datas: trabalhadores 
combineddates as (
    select * from int_datasvendas
    union
    select data_contratacao as combineddate from {{ ref('staging_bd__trabalhadores') }}
)
-- Trazemos o join das datas
-- Usamos distinct para evitar registros duplicados
-- Criamos a chave primaria que identifica as datas para fazer a relação com outras tabelas 
-- deste ou de outros marts
select distinct TO_CHAR(combineddate, 'YYYYMMDD') as pk_data, combineddate as data from combineddates
