import json
import pickle
import numpy as np
import warnings
warnings.filterwarnings('ignore')


def load_saved_artifacts():
    print("loading saved artifacts...start")
    global __data_columns
    global __model

    with open("./artifacts/columns.json", 'r') as f:
        __data_columns = json.load(f)["data_columns"]
    
    with open("./artifacts/amazon.pickle", "rb") as f:
        __model = pickle.load(f)

    print("loading saved artifacts...done")


def get_columns():
    return __data_columns


def delivery(city, sku, quantity, total, fee, cod):
    x = np.zeros(len(__data_columns))

    x[0] = city
    x[1] = sku
    x[2] = quantity
    x[3] = total
    x[4] = fee
    x[5] = cod
    
    d = __model.predict([x])[0]

    if d == 1:
        return 'Delivered to buyer'
    else:
        return 'Returned to seller'
    


if __name__ == '__main__':
    load_saved_artifacts()
    print(get_columns())
    print(delivery(12, 2, 3, 1, 0, 0))
    print(delivery(12, 2, 3, 0, 25558, 1))
