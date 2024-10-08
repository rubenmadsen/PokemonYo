import requests
import duckdb
import pandas as pd

total = 12716
api_url = "https://pokeapi.co/api/v2/"


def total_amount():
    total = 0
    for endpoint in requests.get("https://pokeapi.co/api/v2").json().keys():
        count = requests.get(f"{api_url}{endpoint}/").json()['count']
        total += count
        print(f"Processing {endpoint}:{count}")
    print(f"Total: {total}")

def generate_raw_models(endpoint):
    content = ""
    with open("model_template.py", "r") as rf:
        content = rf.read()
        content = content.replace("ENDPOINT", endpoint)
    out_name = f"models/raw/raw_{endpoint}.py".replace("-", "_")
    with open(out_name, "w") as wf:
        wf.write(content)
        print(f"Wrote {out_name}")


if __name__ == "__main__":
    #total_amount()
    res = requests.get("https://pokeapi.co/api/v2")
    data = res.json()
    for endpoint in data.keys():
        generate_raw_models(endpoint)






