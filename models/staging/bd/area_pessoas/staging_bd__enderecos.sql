with renamed as (
    select 
        cast(ADDRESSID as int) as pk_endereco 
        ,cast(ADDRESSLINE1 as string) as endereco    
        , cast(CITY as varchar) as cidade
        , cast(STATEPROVINCEID as int) as fk_estado 

    from {{ source('bd', 'address') }}

) 
select * from renamed
