with renamed as  ( 
    select 
        cast(SALESORDERID as int) as fk_venda
        , cast(SALESORDERDETAILID as int) as pk_detalhe_venda 
        , cast(ORDERQTY as int) as qtde_produto_por_pedido
        , cast(PRODUCTID as int) as fk_produto
        , cast(UNITPRICE as numeric(18, 2)) as preco_unitario 
        , cast(UNITPRICEDISCOUNT as numeric(18, 2)) as disconto_unitario
        , cast(MODIFIEDDATE as date) as data_modificacao
    from {{ source('bd', 'salesorderdetail') }}
)

select *  from renamed