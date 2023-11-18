import pandas as pd
import requests
class Api():
    def __init__(self):
        self.date = pd.to_datetime(pd.Timestamp.now()).strftime('%Y-%m-%d')
        self.api_url = f'https://www.hongkongairport.com/flightinfo-rest/rest/flights/past?date={self.date}&lang=en&cargo=false&arrival=false'
        self.df = pd.DataFrame()

    def set_date(self, date):
        date = pd.to_datetime(date).strftime('%Y-%m-%d')
        self.api_url = f'https://www.hongkongairport.com/flightinfo-rest/rest/flights/past?date={date}&lang=en&cargo=false&arrival=false'
    
    def api_caller(self, date):
        self.set_date(date)
        # Make a GET request to the API
        response = requests.get(self.api_url)

        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            # Parse the JSON response
            data = response.json()
        # Flatten the data for pandas DataFrame
        flattened_data = []
        for entry in data:
            for flight_info in entry['list']:
                flattened_data.append({
                    "date": entry["date"],
                    "time": flight_info["time"],
                    "flight_no": flight_info["flight"][0]["no"],
                    "airline": flight_info["flight"][0]["airline"],
                    "status": flight_info["status"],
                    "destination": ', '.join(flight_info["destination"]),
                    "terminal": flight_info["terminal"],
                    "aisle": flight_info["aisle"],
                    "gate": flight_info["gate"]
                })

        # Create a DataFrame
        df = pd.DataFrame(flattened_data)
        self.df = df
        return df
    
    def data_stall(self, df):
        self.df.to_csv('flight_data.csv', index=False)

    def get(self):
        return pd.read_csv('flight_data.csv')