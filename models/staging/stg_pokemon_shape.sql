WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_pokemon_shape') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final