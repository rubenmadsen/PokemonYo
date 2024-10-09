WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_machine') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final