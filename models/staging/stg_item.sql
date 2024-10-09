WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_item') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final