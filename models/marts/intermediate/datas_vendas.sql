with vendaheaderdates as (
    select data_ordem as combineddate from {{ ref('staging_bd__vendaheader') }}
    union
    select data_maxima_entrega as combineddate from {{ ref('staging_bd__vendaheader') }}
    union
    select data_envio as combineddate from {{ ref('staging_bd__vendaheader') }}
)

select distinct combineddate from vendaheaderdates