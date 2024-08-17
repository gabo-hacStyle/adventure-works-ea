with rennamed as (

    select 
        cast(ROWGUID as string) as rowguid
        ,cast(PRODUCTID as int ) as pk_produto
        , cast(NAME as string) as nome_produto
        , cast(PRODUCTNUMBER as string) as codigo_produto
        , cast(STANDARDCOST as numeric(18, 2)) as costo_producao
        , cast(PRODUCTSUBCATEGORYID as int) as fk_subcategoria
        , cast(SELLSTARTDATE as date) as data_inicio_venda
        , cast(SELLENDDATE as date) as data_final_venda
        , cast(MODIFIEDDATE as date) as data_modificacao
from {{ source('bd', 'product') }}

)
select * from rennamed