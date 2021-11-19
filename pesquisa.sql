WITH pedidos as (
    SELECT
        order_id,
        customer_id,
        employee_id,
        order_date,
        shipped_date,
        ship_country,
        ship_city,
        ship_via,
        freight
    FROM orders
    WHERE order_date BETWEEN '1997-01-01' AND '1997-12-31'
),

valor_pedidos AS (
    SELECT
        order_id,
        SUM(od.unit_price*od.quantity*(1-od.discount)) AS total_pedido
    FROM order_details od
    GROUP BY order_id
),
pagamentos AS(
    SELECT
        pedidos.order_id,
        pedidos.customer_id,
        pedidos.freight,
        valor_pedidos.total_pedido
    FROM pedidos
    INNER JOIN valor_pedidos ON pedidos.order_id = valor_pedidos.order_id
    ORDER BY order_id
)
SELECT
    COUNT(order_id) AS soma_pedidos,
    SUM(total_pedido - freight) AS total_vendas
FROM pagamentos
