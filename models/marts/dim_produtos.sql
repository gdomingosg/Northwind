with fornecedores as (
    select *
    from {{ref('stg_suppliers')}}

    ),

    prod as (
        select
        sk_produtos,
        id_fornecedor,
        id_produto,
        id_categoria,
        unidades_estoque,
        preco_unitario,
        nome_produto,
        quantidade_por_unidade,
        unidades_em_pedidos,
        descontinuado,
        nivel_reabastecimento
        from {{ref('stg_products')}}
    ),

    juntas_chaves as (
        select
        sk_produtos,
        fornecedores.sk_fornecedor,
        id_produto,
        id_categoria,
        unidades_estoque,
        preco_unitario,
        nome_produto,
        quantidade_por_unidade,
        unidades_em_pedidos,
        descontinuado,
        nivel_reabastecimento
        from prod
        left join fornecedores on prod.id_fornecedor = fornecedores.id_fornecedor
    )

select * from juntas_chaves