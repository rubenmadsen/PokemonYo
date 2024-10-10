import duckdb
import pandas as pd
import plotly.express as px
import plotly.subplots as sp
from plotly.graph_objs import Bar

con = duckdb.connect('storage/database_reading.db', read_only=True)  # Replace with actual DuckDB file

pokemon_stats_df = con.execute('SELECT * FROM dim_pokemon_stats').df()
weight_speed_ratio_df = con.execute('SELECT * FROM dim_weight_speed').df()
attack_defense_ratio_df = con.execute('SELECT * FROM dim_attack_defense').df()

fig = sp.make_subplots(
    rows=3, cols=1,
    subplot_titles=("Pokémon Stats", "Weight vs Speed Ratio", "Attack vs Defense Ratio")
)

fig.add_trace(
    Bar(x=pokemon_stats_df['name'], y=pokemon_stats_df['hp'], name='HP'),
    row=1, col=1
)
fig.add_trace(
    Bar(x=pokemon_stats_df['name'], y=pokemon_stats_df['attack'], name='Attack'),
    row=1, col=1
)
fig.add_trace(
    Bar(x=pokemon_stats_df['name'], y=pokemon_stats_df['defense'], name='Defense'),
    row=1, col=1
)

fig.add_trace(
    Bar(x=weight_speed_ratio_df['name'], y=weight_speed_ratio_df['weight_speed_ratio'], name='Weight/Speed Ratio'),
    row=2, col=1
)

fig.add_trace(
    Bar(x=attack_defense_ratio_df['name'], y=attack_defense_ratio_df['attack_defense_ratio'],
        name='Attack/Defense Ratio'),
    row=3, col=1
)

fig.update_layout(height=1000, width=1200, title_text="Pokémon Visualizations")

fig.show()

con.close()
