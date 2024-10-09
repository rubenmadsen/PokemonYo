WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_egg_group') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final