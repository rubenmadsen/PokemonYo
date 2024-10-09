from pandas import DataFrame
import requests
from concurrent.futures import ThreadPoolExecutor, as_completed

import time
import pandas as pd
limit = 1000
poolsize = 30
def fetch_data_from_endpoints(endpoints, max_workers=poolsize):
    responses = []

    def fetch(url):
        try:
            response = requests.get(url)
            response.raise_for_status()  # Raise an exception for HTTP errors
            return response.json()  # Or use response.text for raw content
        except requests.exceptions.RequestException as e:
            print(f"Error fetching {url}: {e}")
            return None

    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        # Submit all tasks to the thread pool
        future_to_url = {executor.submit(fetch, url): url for url in endpoints}

        # Process as tasks complete
        for future in as_completed(future_to_url):
            url = future_to_url[future]
            data = future.result()
            if data is not None:
                data["url"] = url
                responses.append(data)
                # Optional: Print progress or handle data
                # print(f"Fetched data from {url}")
            else:
                print(f"Failed to fetch data from {url}")

    return responses


def model(dbt, sesssion):
    next_url = f"https://pokeapi.co/api/v2/move-damage-class/?{limit}=60&offset=0"
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
    json_obj = fetch_data_from_endpoints(urls)
    df = DataFrame(json_obj)
    return df

