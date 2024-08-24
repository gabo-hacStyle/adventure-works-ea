with enderecos as (select * from {{ ref("staging_bd__enderecos") }})

--Tentei fazer a travez de CTEs, mas o DBT mandaba um limit antes da consulta e generaba erro
-- no entanto, se faz o join diretamente com o 'ref'

-- Juntamos os endereços registrados com sua cidade, seu estado e pais respectivo
-- o pk do endereõ continua igual
select 
    enderecos.pk_endereco 
    ,enderecos.endereco
    , enderecos.cidade
    , s.nome_estado as estado
    , p.nome_pais as pais
from enderecos
left join {{ ref("staging_bd__estados") }} s on enderecos.fk_estado = s.pk_estado
left join {{ ref('staging_bd__paises') }} p on s.fk_pais = p.pk_pais
