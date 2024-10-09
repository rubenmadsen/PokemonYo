WITH pokemon_weight_speed AS (
  SELECT
    name,
    weight,
    speed,
    -- Calculate the weight to speed ratio
    CASE
      WHEN speed != 0 THEN weight::FLOAT / speed::FLOAT
      ELSE NULL
    END AS weight_speed_ratio
  FROM {{ ref('stg_pokemon') }}
)

SELECT
  name,
  weight,
  speed,
  weight_speed_ratio
FROM pokemon_weight_speed