WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_growth_rate') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final