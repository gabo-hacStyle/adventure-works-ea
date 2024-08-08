with renamed as (
    select 
        cast(CREDITCARDID as int) as pk_cartao
        , cast(CARDTYPE as varchar) as tipo_cartao
    from {{ source('bd', 'creditcard') }}
)
select * from renamed