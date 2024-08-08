
with renamed as (
    select 
        cast(PRODUCTSUBCATEGORYID as int) as pk_subcategoria
        , cast(PRODUCTCATEGORYID as int) as fk_categoria
        , cast(NAME as varchar) as nome_subcategoria
        
    from {{ source('bd', 'productsubcategory') }}
)

select * from renamed