WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_pal_park_area') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final