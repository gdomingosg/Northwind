with ped_detalhados as(
    select
    order_id as id_pedido,
    product_id as id_produto,
    discount as desconto,
    unit_price as preco_unitario,
    quantity as quantidade
    from {{ source('northwind_etl_1', 'order_details')}}
)

select * from ped_detalhados