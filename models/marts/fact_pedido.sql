with orders as (

    select *
    from {{ ref('stg_orders') }}

    ),
    clientes as (
        select *
        from {{ ref('dim_clientes') }}

    ),
    transp as(
        select *
        from {{ ref('dim_transportadora') }}

    ),
    func as(
        select *
        from {{ ref('dim_funcionarios') }}

    ),
    produtos as(
        select *
        from {{ref('dim_produtos')}}

    ),
    juntar_chaves as (
    select
       clientes.sk_cliente, --chave auto-incremental
       transp.sk_transportadora, --chave auto-incremental
       id_pedido,
       func.sk_funcionario, --chave auto-incremental   
       data_pedido,
       regiao_entrega,
       data_expedicao,
       pais_entrega,
       nome_entrega,
       cep_entrega,
       cidade_entrega,
       frete,
       endereco_entrega,
       data_prevista,
       quantidade_total,
       valor_faturado,
       quantidade_itens
    from orders
    left join clientes on orders.id_cliente = clientes.id_cliente
    left join transp on orders.id_transportador = transp.id_transportadora
    left join func on orders.id_funcionario = func.id_funcionario
    ),

    prod_pedido as (
        select
            id_pedido,
            produtos.sk_produtos,
            orders_details.desconto,
            orders_details.preco_unitario,
            orders_details.quantidade
        from {{ref('stg_order_details')}} as orders_details
        left join produtos on orders_details.id_produto = produtos.id_produto

    ),

    final as (
        select
            prod_pedido.id_pedido,
            sk_cliente, --chave auto-incremental
            sk_transportadora, --chave auto-incremental
            sk_funcionario, --chave auto-incremental
            prod_pedido.sk_produtos,   
            data_pedido,
            data_expedicao,
            data_prevista,
            pais_entrega,
            regiao_entrega,
            cidade_entrega,
            cep_entrega,
            endereco_entrega,
            nome_entrega,
            frete,
            prod_pedido.desconto,
            prod_pedido.preco_unitario,
            prod_pedido.quantidade
        from juntar_chaves
        left join prod_pedido on juntar_chaves.id_pedido = prod_pedido.id_pedido
    )

select * from final