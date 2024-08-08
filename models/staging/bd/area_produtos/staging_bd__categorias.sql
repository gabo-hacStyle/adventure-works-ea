with renamed as (
    select 
        cast(PRODUCTCATEGORYID as int) as pk_categoria
        , cast(NAME as varchar) as nome_categoria 
        
    from {{ source('bd', 'productcategory') }}
)
select * from renamed