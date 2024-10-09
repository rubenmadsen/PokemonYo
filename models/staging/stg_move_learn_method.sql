WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_move_learn_method') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final