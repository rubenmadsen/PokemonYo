WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_evolution_chain') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final