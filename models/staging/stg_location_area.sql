WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_location_area') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final