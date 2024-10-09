WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_language') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final