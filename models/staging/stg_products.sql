with produtos as(
    select
    row_number() over (order by product_id) as sk_produtos,
    product_id as id_produto,
    units_in_stock as unidades_estoque,
    category_id as id_categoria,
    unit_price as preco_unitario,
    product_name as nome_produto,
    quantity_per_unit as quantidade_por_unidade,
    supplier_id as id_fornecedor,
    units_on_order as unidades_em_pedidos,
    discontinued as descontinuado,
    reorder_level as nivel_reabastecimento
    from {{ source('northwind_etl_1', 'products')}}
)

select * from produtos