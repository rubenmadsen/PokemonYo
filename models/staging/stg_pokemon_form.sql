WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_pokemon_form') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final