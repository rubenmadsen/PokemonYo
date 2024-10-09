WITH source AS (
  SELECT
    *
  FROM {{ ref('stg_move_battle_style') }}
),

final AS (
  SELECT
    id
  FROM source
)

SELECT * FROM final