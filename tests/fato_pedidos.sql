with validacao as(
    SELECT count(distinct id_pedido) as dist
    FROM {{ref('fact_pedido')}}
    WHERE data_pedido between '1996-07-04' and '1998-05-06'
)
SELECT * from validacao where dist != 830