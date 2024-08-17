with renamed as (
    select 
        cast(BUSINESSENTITYID as int) as  fk_pessoa
        , cast(ADDRESSID as int) as fk_endereco
    from {{ source('bd', 'businessentityaddress') }}
)
select * from renamed