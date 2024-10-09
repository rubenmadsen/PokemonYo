WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_berry') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final