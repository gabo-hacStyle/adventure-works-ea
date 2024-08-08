with rennamed as (

    select 
        cast(PRODUCTID as int ) as pk_produto
        , cast(NAME as string) as nome_produto
        , cast(PRODUCTNUMBER as string) as codigo_produto
        , cast(STANDARDCOST as numeric(18, 2)) as costo_producao
        
        , cast(PRODUCTSUBCATEGORYID as int) as subcategoria
        , cast(SELLSTARTDATE as date) as inicio_data_venda
        , case
                when SELLENDDATE = NULL then FALSE
                else TRUE
            end as eh_discontinuado  
        , cast(MODIFIEDDATE as date) as data_modificacao
from {{ source('bd', 'product') }}

)
select * from rennamed