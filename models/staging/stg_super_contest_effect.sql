WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_super_contest_effect') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final