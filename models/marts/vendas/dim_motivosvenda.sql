with vendaemotivo as (
    select 
        *
    from {{ ref('staging_bd__vendas_com_motivos') }} 
),
motivo as (
    select * from {{ ref('staging_bd__motivosvenda') }}
),

joined as (
    select 
        md5(fk_venda || pk_motivo) as sk_motivosvenda
        , FK_VENDA
        ,PK_MOTIVO
        ,MOTIVO
    from vendaemotivo
    left join motivo on vendaemotivo.fk_motivo = motivo.pk_motivo
)

select * from joined