WITH source AS (
  SELECT
    *
  FROM {{ ref('stg_berry') }}
),

final AS (
  SELECT
    id
  FROM source
)

SELECT * FROM final