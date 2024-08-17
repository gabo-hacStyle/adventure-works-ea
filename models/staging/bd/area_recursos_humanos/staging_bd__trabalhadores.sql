with renamed as (
    select 
        cast(ROWGUID as string) as rowguid
        , cast(BUSINESSENTITYID as int) as pk_trabalhador 
        , cast(JOBTITLE as varchar) as posto_trabalho 
        , CASE
            WHEN GENDER = 'M' THEN 'Masculino'
            WHEN GENDER = 'F' THEN 'Femenino'
            ELSE NULL
        END AS genero
        , cast(HIREDATE as date) as  data_contratacao 
        , cast(MODIFIEDDATE as date) as data_modificacao 
    from {{ source('bd', 'employee') }}
)

select * from renamed