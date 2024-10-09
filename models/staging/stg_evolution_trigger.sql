WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_evolution_trigger') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final