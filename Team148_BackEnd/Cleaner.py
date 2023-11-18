import re
import pandas as pd
class Cleaner():
    def __init__(self) -> None:
        pass

    def data_cleaner(self, df):
        # Extract time from 'status' column using regex
        time_pattern = re.compile(r'Dep (\d{2}:\d{2})(?: \((\d{2}/\d{2}/\d{4})\))?')
        matches = df['status'].str.extract(time_pattern)
        # Fill NaN values in 'matches[1]' with corresponding values from 'date' column
        matches[1] = matches[1].fillna(df['date'])
        matches[1] = pd.to_datetime(matches[1], errors='coerce', format='%Y-%m-%d') 
        matches[1] = matches[1].fillna((pd.to_datetime(df['date'], errors='coerce')+ pd.DateOffset(days=1)).dt.strftime('%Y-%m-%d'))

        # Combine 'status_time' and 'date' based on matches[1] presence
        df['status_time'] = pd.to_datetime(matches[1].dt.strftime('%Y-%m-%d') + ' ' + matches[0])

        # Convert 'status_time' and 'time' columns to datetime objects
        df['cal_time'] = pd.to_datetime(df['date'] + ' ' + df['time'])

        # Calculate the time difference in minutes and create a new 'delta' column
        df['delta'] = (df['status_time'] - df['cal_time']).dt.total_seconds() / 60
        df = df[df['status'] != 'Cancelled'].reset_index(drop=True)
        
        # Print the updated DataFrame
        return df
    
    def data_train(self, df, date):
        # Separate the DataFrame into two parts based on the timestamp
        specific_timestamp = pd.to_datetime(date)
        df['delta_01'] = (df['delta'] > 0).astype(int)
        train = df[df['cal_time'] < specific_timestamp].reset_index(drop=True)
        predict = df[df['cal_time'] >= specific_timestamp].reset_index(drop=True)
        return train, predict
    
    def train_test_split(self, df, split_date, features):
        specific_timestamp = pd.to_datetime(split_date)
        test_indeces = (df['cal_time'] >= specific_timestamp).idxmax()
        df_train = df.loc[:,features]
        target = df.loc[:,['delta_01']]
        df_predictor = pd.get_dummies(df_train, columns=features)

        X_train = df_predictor[:test_indeces].reset_index(drop=True)
        y_train = target[:test_indeces].reset_index(drop=True)

        X_test = df_predictor[test_indeces:].reset_index(drop=True)
        y_test = target[test_indeces:].reset_index(drop=True)
        return X_train, y_train, X_test, y_test, test_indeces