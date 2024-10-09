WITH source AS (
  SELECT
    *
  FROM {{ ref('RAW_TABLE') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final