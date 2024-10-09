WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_item_pocket') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final