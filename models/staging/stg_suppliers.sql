with fornc as(
    select
    row_number() over (order by supplier_id) as sk_fornecedor,
    supplier_id as id_fornecedor,
    company_name as fornecedor,
    contact_name as nome_contato,
    contact_title as cargo,
    phone as telefone,
    country as pais,
    region as regiao,
    city as cidade,
    postal_code as cep,
    address as endereco
    from {{ source('northwind_etl_1', 'suppliers')}}
)


select * from fornc