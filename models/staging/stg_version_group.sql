WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_version_group') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final