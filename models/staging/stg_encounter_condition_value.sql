WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_encounter_condition_value') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final