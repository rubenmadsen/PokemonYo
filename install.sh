python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
python3 generate_raw_models.py
dbt run
python3 visualizer.py