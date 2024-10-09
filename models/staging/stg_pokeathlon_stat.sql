WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_pokeathlon_stat') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final