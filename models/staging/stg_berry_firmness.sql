WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_berry_firmness') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final