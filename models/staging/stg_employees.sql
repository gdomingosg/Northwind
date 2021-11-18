with funcionarios as(
    select
    row_number() over (order by employee_id) as sk_funcionario,
    employee_id as id_funcionario,
    first_name as primeiro_nome,
    last_name as sobrenome,
    title as cargo,
    home_phone as telefone,
    country as pais,
    region as regiao,
    city as cidade,
    postal_code as cep,
    address as endereco
    from {{ source('northwind_etl_1', 'employees')}}
),
    final as(
        select
        sk_funcionario,
        id_funcionario,
        primeiro_nome,
        sobrenome,
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
        from funcionarios
    )

select * from final