WITH source AS (
  SELECT
    *
  FROM {{ ref('raw_move_battle_style') }}
),


final AS (
  SELECT
  source.url as id,
  FROM source
)


SELECT * FROM final