with tratados as(
        select
        sk_fornecedor,
        id_fornecedor,
        fornecedor,
        nome_contato,
        cargo,
        telefone,
        pais,
        case 
            when regiao is null then 'Other'
            else regiao
        end regiao,
        cidade,
        cep,
        endereco
        from {{ref('stg_suppliers')}}
    )
select * from tratados