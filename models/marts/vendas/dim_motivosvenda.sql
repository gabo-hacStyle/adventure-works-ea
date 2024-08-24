
-- Trazemos uma tabela intermediaria de uma relação many-to-many
-- entre as vendas (por nota fiscal) e seus motivos de venda
with vendaemotivo as (
    select 
        *
    from {{ ref('staging_bd__vendas_com_motivos') }} 
),
-- Tabela com todos os motivos
motivo as (
    select * from {{ ref('staging_bd__motivosvenda') }}
),

joined as (
    select 
        -- sendo uma tabela intermediaria de uma relação many-to-many
        -- precisa ter uma chave primaria (neste caso será sk) para identificar cada relação única
        md5(fk_venda || pk_motivo) as sk_motivosvenda
        , FK_VENDA
        ,PK_MOTIVO
        ,MOTIVO
    from vendaemotivo
    left join motivo on vendaemotivo.fk_motivo = motivo.pk_motivo
)

select * from joined