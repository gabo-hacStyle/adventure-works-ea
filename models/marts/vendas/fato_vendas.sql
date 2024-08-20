with
    int_vendas as (select * from {{ ref("int_fatos") }}),
    dim_produtos as (select * from {{ ref("dim_produtos") }}),

    dim_vendedores as (select * from {{ ref("dim_vendedores") }}),
    dim_clientes as (select * from {{ ref("dim_clientes") }}),

    dim_datas as (select * from {{ ref("dim_datas") }}),

    dim_enderecos as (select * from {{ ref("dim_enderecos") }}),

    staging_vendedores as (select * from {{ ref("staging_bd__trabalhadores") }}),

    joined as (
        select
            sk_vendas,
            pk_venda as nota_fiscal,
            fk_produto,
            fk_cliente,
            fk_endereco_cliente,
            fk_vendedor,
            fk_endereco_vendedor,
            to_char(data_contratacao, 'YYYYMMDD') as fk_data_contratacao_vendedor,
            fk_data_ordem,
            fk_data_maxima_entrega,
            fk_data_envio,
            qtde_produto_por_pedido,
            preco_unitario,
            disconto_unitario,
            motivo,
            valor_negociado,
            valor_negociado_liquido,
            nome_produto,
            codigo_produto,
            costo_producao,
            nome_subcategoria,
            nome_categoria,
            dim_clientes.nome_completo as nome_completo_cliente,
            case
                when dim_vendedores.nome_completo is null
                then 'Online'
                else dim_vendedores.nome_completo
            end as nome_completo_vendedor,
            dim_vendedores.posto_trabalho as posto_trabalho_vendedor,
            dim_vendedores.genero as genero_vendedor

        from int_vendas
        left join dim_produtos on int_vendas.fk_produto = dim_produtos.pk_produto
        left join dim_clientes on int_vendas.fk_cliente = dim_clientes.pk_cliente
        left join
            dim_vendedores on int_vendas.fk_vendedor = dim_vendedores.pk_trabalhador
        left join
            staging_vendedores
            on int_vendas.fk_vendedor = staging_vendedores.pk_trabalhador
    )

select *
from joined
