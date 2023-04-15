import json
import pickle
import numpy as np
import pandas as pd
import warnings
warnings.filterwarnings('ignore')


def load_saved_artifacts():
    print("loading saved artifacts...start")
    global __data_columns
    global __model

    with open("C:/Users/Administrator/Documents/data science/Projects/Electricity Price Prediction/artifacts/columns.json", 'r') as f:
        __data_columns = json.load(f)["data_columns"]
    
    with open("C:/Users/Administrator/Documents/data science/Projects/Electricity Price Prediction/artifacts/elect.pickle", "rb") as f:
        __model = pickle.load(f)

    print("loading saved artifacts...done")


def get_columns():
    return __data_columns


def predict_electricity(day, month, forcastwind, SLEA, SMPEA, temp, wind, co2, actualwind, load):
    data = [[day, month, forcastwind, SLEA, SMPEA, temp, wind, co2, actualwind, load]]
    X_input = pd.DataFrame(data, columns=__data_columns)
    
    price = np.round(__model.predict(X_input)[0])
    return price

if __name__ == '__main__':
    load_saved_artifacts()
    # print(predict_electricity(10, 12, 54.10, 4241.05, 49.56, 9.0, 14.8, 491.32, 54.0, 4426.84))
    print(__data_columns)