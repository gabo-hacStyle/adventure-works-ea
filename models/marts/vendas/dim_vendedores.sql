with vendedores as (
    select 
        *
    from {{ ref('staging_bd__trabalhadores') }}
),

pessoas as (
    select
        *
    from {{ ref('staging_bd__pessoas') }}
),

joined as (
    select 
        ROWGUID as sk_vendedor
        , PK_TRABALHADOR
        , NOME_COMPLETO
        , POSTO_TRABALHO
        , GENERO
        , DATA_MODIFICACAO
    from vendedores 
    left join pessoas on vendedores.PK_TRABALHADOR = pessoas.pk_pessoa
)

select * from joined