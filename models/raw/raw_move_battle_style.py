from pandas import DataFrame
import requests
import time
import pandas as pd

def model(dbt, session):
    endpoint = "move-battle-style"  # Replace with the actual endpoint or parameterize it
    base_url = f"https://pokeapi.co/api/v2/{endpoint}"
    next_url = base_url
    all_results = []

    while next_url is not None:
        response = requests.get(next_url)
        data = response.json()
        next_url = data.get("next")
        results = data.get("results", [])

        # Fetch detailed data for each item
        for item in results:
            item_url = item['url']
            item_response = requests.get(item_url)
            item_data = item_response.json()
            all_results.append(item_data)
            time.sleep(0.1)  # Short delay to respect API rate limits

        time.sleep(0.5)  # Delay between pages to be polite to the API

    # Flatten the nested JSON data
    df = pd.json_normalize(all_results, sep='_')
    return df


# def model(dbt, sesssion):
#     next_url = "https://pokeapi.co/api/v2/move-battle-style"
#     results = []
#
#     while next_url is not None:
#         response = requests.get(next_url)
#         data = response.json()
#         next_url = data["next"]
#         results.extend(data["results"])
#     df = DataFrame(results)
#     return df

