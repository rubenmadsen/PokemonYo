WITH pokemon_attack_defense AS (
  SELECT
    name,
    attack,
    defense,
    -- Calculate the attack to defense ratio
    CASE
      WHEN defense != 0 THEN attack::FLOAT / defense::FLOAT
      ELSE NULL
    END AS attack_defense_ratio
  FROM {{ ref('stg_pokemon') }}
)

SELECT
  name,
  attack,
  defense,
  attack_defense_ratio
FROM pokemon_attack_defense