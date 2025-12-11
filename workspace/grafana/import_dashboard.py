
import json
import glob
import time
import requests
def wait_for_grafana():
    url = "http://127.0.0.1:3131/api/health"
    while True:
        try:
            response = requests.get(url)
            if response.status_code == 200:
               break
        except:
            print("waiting for grafana to start...")
        time.sleep(5)

def import_dashboard(file):
    url = "http://admin:admin@localhost:3131/api/dashboards/db"
    with open(file, "r") as f:
        data = json.load(f)
    headers = {
        "Content-Type": "application/json",
    }
    payload = {
        "dashboard": data,
        "folderId": 0,
        "overwrite": True,
    }
    response = requests.post(url, json=payload, headers=headers)
    print(response.text)

if __name__ == "__main__":
    for file in glob.glob("./dashboards/*.json"):
        print(f"importing {file}")
        import_dashboard(file)