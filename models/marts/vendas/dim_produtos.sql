with produtos  as (
    select 
        *
    from {{ ref('staging_bd__produtos') }}
),
categorias as (
    select 
        *
    from {{ ref('staging_bd__categorias') }}
),
subcategorias as (
    select 
        *
    from {{ ref('staging_bd__subcategorias') }}
),
joined as (
    select
        ROWGUID as sk_produto
        , PK_PRODUTO
        , NOME_PRODUTO
        , CODIGO_PRODUTO
        , COSTO_PRODUCAO
        , NOME_SUBCATEGORIA
        , NOME_CATEGORIA
        , DATA_INICIO_VENDA
        , DATA_FINAL_VENDA
        , DATA_MODIFICACAO
    from produtos 
    left join subcategorias on produtos.fk_subcategoria = subcategorias.pk_subcategoria
    left join categorias on subcategorias.fk_categoria = categorias.pk_categoria
)

select * from joined