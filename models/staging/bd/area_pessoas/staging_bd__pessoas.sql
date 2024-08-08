with renamed as (
    select 
        cast(BUSINESSENTITYID as  int) as pk_pessoa
        , concat(
            cast(FIRSTNAME as varchar) 
            , ' '
            , cast(LASTNAME as varchar) 
        ) as nome_completo
    from {{ source('bd', 'person') }}
)

select * from renamed