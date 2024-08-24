with clientes as (
    select 
        *
    from {{ ref('staging_bd__clientes') }}
),

-- Tabela para encontrar os nomes dos clientes
pessoas as (
    select 
        *
    from {{ ref('staging_bd__pessoas') }}
),

joined as (
    select 
        ROWGUID as sk_cliente
        , PK_CLIENTE
        , NOME_COMPLETO
        , DATA_MODIFICACAO
    from clientes 
    left join pessoas on clientes.fk_pessoa = pessoas.pk_pessoa
)

select * from joined