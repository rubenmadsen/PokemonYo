WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_pokemon_color') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final