with dados_fonte as(
    select
    row_number() over (order by customer_id) as sk_cliente,
    customer_id as id_cliente,
    contact_name as nome_contato,
    phone as telefone,
    company_name as nome_empresa,
    country as pais,
    region as regiao,
    city as cidade,
    postal_code as cep,
    address as endereco
    from {{ source('northwind_etl_1', 'customers')}}
),
    final as (
        select
        sk_cliente,
        id_cliente,
        nome_contato,
        telefone,
        nome_empresa,
        pais,
        case 
            when regiao is null then 'Other'
            else regiao
        end regiao,
        cidade,
        cep,
        endereco
        from dados_fonte
    )

select * from final
