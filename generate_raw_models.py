import requests
import shutil


api_url = "https://pokeapi.co/api/v2/"


def generate_raw_models(endpoint):
    content = ""
    with open("templates/model_template.py", "r") as rf:
        content = rf.read()
        content = content.replace("ENDPOINT", endpoint)
    out_name = f"models/raw/raw_{endpoint}.py".replace("-", "_")
    with open(out_name, "w") as wf:
        wf.write(content)
        print(f"Wrote {out_name}")
    #generate_staging_models(endpoint)

# def generate_staging_models(endpoint):
#     stg_out_name = f"models/staging/stg_{endpoint}.sql".replace("-", "_")
#     content = ""
#     with open("templates/staging_template.sql", "r") as rf:
#         content = rf.read()
#         content = content.replace("RAW_TABLE", f"raw_{endpoint}".replace("-","_"))
#     with open(stg_out_name, "w") as wf:
#         wf.write(content)
#         print(f"Wrote {stg_out_name}")

if __name__ == "__main__":
    #total_amount()
    res = requests.get("https://pokeapi.co/api/v2")
    data = res.json()
    for endpoint in data.keys():
        generate_raw_models(endpoint)
    shutil.copy('storage/database.db', 'storage/database_reading.db')






