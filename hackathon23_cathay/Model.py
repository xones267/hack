import pandas as pd
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense, Dropout

class model():
    def __init__(self) -> None:
        self.clf = None
    def LSTM(self, X_train, X_test, y_train, y_test):

        X_train = X_train.to_numpy().reshape((X_train.shape[0], 1, X_train.shape[1]))
        y_train = y_train.to_numpy().reshape((X_test.shape[0], 1, X_test.shape[1]))

        clf = Sequential()
        clf.add(LSTM(units=120, activation='relu', return_sequences=True, input_shape=(X_train.shape[1], X_train.shape[2])))
        clf.add(Dropout(0.3))  # Dropout for regularization

        # Third LSTM layer with more units and dropout
        clf.add(LSTM(units=100, activation='relu'))
        clf.add(Dropout(0.3))  # Dropout for regularization

        # Dense layer with more units
        clf.add(Dense(units=50, activation='relu'))

        # Output layer
        clf.add(Dense(units=1, activation='sigmoid'))

        # Compile the model
        clf.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

        # Train the model
        clf.fit(X_train, y_train, epochs=3, batch_size=32, validation_data=(X_test, y_test))

        self.clf = clf

        
        return clf
    
    def predict(self, X_test, y_test):

        y_prob = self.clf.predict(X_test)

        custom_threshold = 0.5
        y_test_pred = (y_prob > custom_threshold).astype(int)
        
        y_test_set = pd.DataFrame(y_prob, columns=['Prob'])
        return y_test_set


    def metric(df, y_test_set, test_indices):
    
        prob_delta = (df.iloc[test_indices:,]).reset_index(drop=True)
        
        prob = pd.concat([y_test_set, prob_delta] , axis=1)
        prob = prob[prob['airline'] == 'CPA']
        prob = prob.sort_values(by='Prob', ascending=False).reset_index(drop=True)
        
        # Specify the columns for the scatter plot
        column_x = 'Prob'
        column_y = 'delta'
        filtered_df = prob[prob['delta'] <= 200]
        # Plot the scatter plot
        # Plot the scatter plot with regression line
        import seaborn as sns
        sns.regplot(x=column_x, y=column_y, data=filtered_df, scatter_kws={'s': 50}, line_kws={'color': 'red', 'label': 'Regression Line'})

        # Add labels and title
        plt.xlabel(column_x)
        plt.ylabel(column_y)
        plt.title('Scatter Plot with Regression Line (Values <= 200)')
        plt.legend()

        # Show the plot
        plt.show()
        prob_20 = prob[:10]
        print(prob_20[prob_20['delta'] > 15].count()[0]/10)
        print(prob['delta'][:10].mean())
        return prob