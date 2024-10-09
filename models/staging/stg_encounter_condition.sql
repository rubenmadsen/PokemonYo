WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_encounter_condition') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final