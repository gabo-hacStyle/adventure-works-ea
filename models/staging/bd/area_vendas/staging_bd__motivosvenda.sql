with renamed as (
    select 
        cast(SALESREASONID as int) as pk_motivo
        , cast(NAME as varchar) as motivo
    from {{ source('bd', 'salesreason') }}
)

select * from renamed