with pedidos as (
    select
        order_id as id_pedido,
        employee_id as id_funcionario,
        customer_id as id_cliente,
        ship_via as id_transportador,
        order_date as data_pedido,
        shipped_date as data_expedicao,
        ship_country as pais_entrega,
        ship_region as regiao_entrega,
        ship_name as nome_entrega,
        ship_postal_code as cep_entrega,
        ship_city as cidade_entrega,
        freight as frete,
        ship_address as endereco_entrega,
        required_date as data_prevista
    from {{ source('northwind_etl_1', 'orders')}}
),
    pedido_item as (
        select
        order_id as id_pedido,
        sum(quantity) as quantidade_total,
        sum(unit_price*(1-discount) * quantity) as valor_faturado,
        count(*) as quantidade_itens
        from {{ source('northwind_etl_1', 'order_details')}}
        group by order_id

    ),

    dados_juntados as (
        select
        pedidos.id_pedido,
        id_cliente,
        id_funcionario, -- preciso trocar por sk
        id_transportador, -- preciso trocar por sk       
        data_pedido,
        data_expedicao,
        data_prevista,
        pais_entrega,
        case 
            when regiao_entrega is null then 'Other'
            else regiao_entrega
        end regiao_entrega,
        cidade_entrega,
        cep_entrega,
        endereco_entrega,
        nome_entrega,
        frete,
        quantidade_total,
        valor_faturado,
        quantidade_itens
        from pedidos
        left join pedido_item on pedidos.id_pedido = pedido_item.id_pedido

    )

select * from dados_juntados