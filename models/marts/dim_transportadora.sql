with transportadora as (
    select *
    from {{ref('stg_shippers')}}
)

select * from transportadora