import json
import glob
import time
import requests
import sys


GRAFANA_URL = "http://127.0.0.1:3131"

AUTH = ("admin", "admin")


def wait_for_grafana():
    print(f"Checking connection to {GRAFANA_URL}...")
    url = f"{GRAFANA_URL}/api/health"
    while True:
        try:
            response = requests.get(url, timeout=5)  # 加上 timeout 防止挂起
            if response.status_code == 200:
                print(" Grafana is ready!")
                break
        except requests.exceptions.RequestException:
            print(" Waiting for Grafana to start...")
        except KeyboardInterrupt:
            print(" Script stopped by user.")
            sys.exit(1)

        time.sleep(5)


def import_dashboard(file_path):
    url = f"{GRAFANA_URL}/api/dashboards/db"

    try:
        with open(file_path, "r", encoding="utf-8") as f:
            dashboard_data = json.load(f)
    except Exception as e:
        print(f" Failed to read file {file_path}: {e}")
        return

    if "id" in dashboard_data:
        dashboard_data["id"] = None

    payload = {
        "dashboard": dashboard_data,
        "folderId": 0,  # 0 = General Folder
        "overwrite": True,
    }

    headers = {"Content-Type": "application/json", "Accept": "application/json"}

    try:
        response = requests.post(url, json=payload, headers=headers, auth=AUTH)

        if response.status_code == 200:
            data = response.json()
            print(
                f" Imported {file_path} (UID: {data.get('uid')}, Status: {data.get('status')})"
            )
        else:
            print(f" Failed to import {file_path}. Status: {response.status_code}")
            print(f"   Error: {response.text}")

    except Exception as e:
        print(f" API Request failed for {file_path}: {e}")


if __name__ == "__main__":
    wait_for_grafana()

    files = glob.glob("./dashboard_templates/*.json")

    for file in files:
        import_dashboard(file)
    print("Done!, visit grafana at : localhost:3131")
