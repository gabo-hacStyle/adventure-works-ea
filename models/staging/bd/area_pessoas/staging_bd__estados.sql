with  renamed as (
    select 
         cast(STATEPROVINCEID as int) as pk_estado
        , cast(COUNTRYREGIONCODE as varchar) as fk_pais 
        , cast(NAME as varchar) as nome_estado
    from {{ source('bd', 'stateprovince') }}
) 

select * from renamed