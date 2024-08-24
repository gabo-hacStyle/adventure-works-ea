/*  
    Este teste garante que as vendas brutas de 2011 estão
    corretas com o valor auditado da contabilidade.
*/

{{
    config(
        severity = 'error'
    )
}}

with
    vendas_em_2011 as (
        select sum(valor_negociado_liquido) as total_bruto
        from {{ ref('fato_vendas') }}

        -- Usamos a chave foranea para facilitar a busca dos registros 
        -- que foram realizados no 2011
        where fk_data_ordem like '2011%'
    ) 

select total_bruto
from vendas_em_2011
where total_bruto between 12646112 and 12646113