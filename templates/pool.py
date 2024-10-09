import requests
from concurrent.futures import ThreadPoolExecutor, as_completed

poolsize = 30


def fetch_data_from_endpoints(endpoints, max_workers=poolsize):
    responses = []

    def fetch(url):
        try:
            response = requests.get(url)
            response.raise_for_status()
            return response.json()
        except requests.exceptions.RequestException as e:
            print(f"Error fetching {url}: {e}")
            return None

    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        future_to_url = {executor.submit(fetch, url): url for url in endpoints}

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
