WITH pokemon_stats AS (
  SELECT
    id,
    name,
    hp,
    attack,
    defense,
    special_attack,
    special_defense,
    speed
  FROM {{ ref('stg_pokemon') }}
)

SELECT
  id,
  name,
  hp,
  attack,
  defense,
  special_attack,
  special_defense,
  speed
FROM pokemon_stats