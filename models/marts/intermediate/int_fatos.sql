-- Trazemos informação sobre as tabelas de vendas
-- cartões e endereços

with vendaheader as (
    select * from {{ ref('staging_bd__vendaheader') }}
),
vendadetalhe as (
    select 
        *
    from {{ ref('staging_bd__vendadetalhes') }} 
),
cartao as (
    select 
        *
    from {{ ref('staging_bd__cartoes') }} 
),


-- Trazemos a tabela da source que contem todos os endereços das pessõas
-- para definir a chave foranea de endereço para os vendedores à ser usada na fato
  
staging_endereco_pesoa as (
    select * from {{ ref('staging_bd__endereco_por_pessoa') }}
),

joined as (
    select 
        vendaheader.pk_venda
        , vendadetalhe.FK_PRODUTO
        , vendaheader.FK_CLIENTE
        , vendaheader.FK_ENDERECO as fk_endereco_cliente
        , vendaheader.FK_VENDEDOR
        , ep.fk_endereco as fk_endereco_vendedor
        , TO_CHAR(vendaheader.DATA_ORDEM, 'YYYYMMDD') as fk_data_ordem
        , TO_CHAR(vendaheader.DATA_MAXIMA_ENTREGA, 'YYYYMMDD') as fk_data_maxima_entrega
        , TO_CHAR(vendaheader.DATA_ENVIO, 'YYYYMMDD') as fk_data_envio
        , vendadetalhe.QTDE_PRODUTO_POR_PEDIDO
        , vendadetalhe.PRECO_UNITARIO
        , vendadetalhe.DISCONTO_UNITARIO
        , vendaheader.ESTATUS
        , vendaheader.EH_ONLINE
        , cartao.TIPO_CARTAO
        , vendadetalhe.data_modificacao
    from vendaheader 
    left join vendadetalhe on vendaheader.pk_venda = vendadetalhe.fk_venda
    left join cartao on vendaheader.fk_cartao = cartao.pk_cartao
    left join staging_endereco_pesoa ep on vendaheader.fk_vendedor = ep.fk_pessoa
),

-- Adicionamos as métricas

metricas as (
    select 
        *
        , preco_unitario * qtde_produto_por_pedido as valor_negociado
        , preco_unitario * qtde_produto_por_pedido - (1-disconto_unitario) as valor_negociado_liquido
    from joined
)

select * from metricas

