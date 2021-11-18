with transp as(
    select
    row_number() over (order by shipper_id) as sk_transportadora,
    shipper_id as id_transportadora,
    company_name as nome_transportadora,
    phone as telefone
    from {{ source('northwind_etl_1', 'shippers')}}
)

select * from transp