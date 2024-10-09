WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_ability') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final