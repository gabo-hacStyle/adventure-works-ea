with renamed as(
    select 
        cast(SALESORDERID as int ) as pk_venda
        , cast(ORDERDATE as date ) as data_ordem
        , cast(DUEDATE as date) as data_maxima_entrega
        , cast(SHIPDATE as date) as data_envio
        , cast(STATUS as int) as estatus
        , cast(ONLINEORDERFLAG as boolean) as eh_online
        , cast(CUSTOMERID as int) as fk_cliente
        , cast(SALESPERSONID as int) as fk_vendedor
        , cast(SHIPTOADDRESSID as int) as fk_endereco
        , cast(CREDITCARDID as int )as fk_cartao
        , cast(MODIFIEDDATE as date) as data_modificacao     
    from {{ source('bd', 'salesorderheader') }}
)

select * from renamed