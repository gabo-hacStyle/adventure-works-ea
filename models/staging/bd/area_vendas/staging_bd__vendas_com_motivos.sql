with renamed as (
    select 
        cast(SALESORDERID as int) as fk_venda
        , cast(SALESREASONID as int) as fk_motivo
    from {{ source('bd', 'salesorderheadersalesreason') }}
)
select * from renamed