WITH source AS (
  SELECT
    id,
    name,
    CAST(weight AS INTEGER) AS weight,
    CAST(height AS INTEGER) AS height,
    -- Extract base stats by filtering based on stat.name
    (SELECT CAST(stat->>'base_stat' AS INTEGER)
     FROM UNNEST(stats) AS s(stat)
     WHERE stat->>'stat'->>'name' = 'hp') AS hp,

    (SELECT CAST(stat->>'base_stat' AS INTEGER)
     FROM UNNEST(stats) AS s(stat)
     WHERE stat->>'stat'->>'name' = 'attack') AS attack,

    (SELECT CAST(stat->>'base_stat' AS INTEGER)
     FROM UNNEST(stats) AS s(stat)
     WHERE stat->>'stat'->>'name' = 'defense') AS defense,

    (SELECT CAST(stat->>'base_stat' AS INTEGER)
     FROM UNNEST(stats) AS s(stat)
     WHERE stat->>'stat'->>'name' = 'special-attack') AS special_attack,

    (SELECT CAST(stat->>'base_stat' AS INTEGER)
     FROM UNNEST(stats) AS s(stat)
     WHERE stat->>'stat'->>'name' = 'special-defense') AS special_defense,

    (SELECT CAST(stat->>'base_stat' AS INTEGER)
     FROM UNNEST(stats) AS s(stat)
     WHERE stat->>'stat'->>'name' = 'speed') AS speed,

    -- Extract the primary Pokémon type
    -- types[0].type.name AS primary_type
  FROM
    {{ ref('raw_pokemon') }}
)

-- Final selection of cleaned and typed columns
SELECT
  id,
  name,
  weight,
  height,
  hp,
  attack,
  defense,
  special_attack,
  special_defense,
  speed
FROM
  source