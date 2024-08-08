with renamed as (
    select 
        cast(COUNTRYREGIONCODE as varchar) as pk_pais
        , cast(NAME as varchar) as nome_pais
    from {{ source('bd', 'countryregion') }}
)

select * from renamed