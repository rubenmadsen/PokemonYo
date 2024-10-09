from pandas import DataFrame
import requests
import sys
import os
pool_path = os.path.abspath(os.path.join(__file__, "../../../templates"))
sys.path.insert(0, pool_path)
import pool
import shutil
limit = 1000



def model(dbt, sesssion):
    next_url = f"https://pokeapi.co/api/v2/ENDPOINT/?{limit}=60&offset=0"
    results = []

    while next_url is not None:
        response = requests.get(next_url)
        data = response.json()
        next_url = data["next"]
        results.extend(data["results"])
    # json_obj = []
    # for f in results:
    #     json_obj.append(requests.get(f["url"]).json())
    urls = [obj['url'] for obj in results]
    json_obj = pool.fetch_data_from_endpoints(urls)
    df = DataFrame(json_obj)
    #shutil.copy('storage/database.db', 'storage/database_reading.db')
    return df

