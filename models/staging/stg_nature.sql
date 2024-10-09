WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_nature') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final