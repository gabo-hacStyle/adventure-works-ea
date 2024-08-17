with renamed as (
    select 
        cast(ROWGUID as string) as rowguid 
        ,cast(CUSTOMERID as int) as pk_cliente
        , cast(PERSONID as int) as fk_pessoa 
        , cast(MODIFIEDDATE as date) as data_modificacao 
    from {{ source('bd', 'customer') }}
)
select * from renamed