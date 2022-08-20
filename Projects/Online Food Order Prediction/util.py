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
    
    with open("./artifacts/order.pickle", "rb") as f:
        __model = pickle.load(f)

    print("loading saved artifacts...done")


def get_columns():
    return __data_columns


def order_again1(age, gender, marital, occupation, income, qualification, fam_size, pin, feedback):
    x = np.zeros(len(__data_columns))

    x[0] = age
    x[1] = gender
    x[2] = marital
    x[3] = occupation
    x[4] = income
    x[5] = qualification
    x[6] = fam_size
    x[7] = pin
    x[8] = feedback 

    d = __model.predict([x])[0]

    if d == 1:
        return 'Yes'
    else:
        return 'No'


if __name__ == '__main__':
    load_saved_artifacts()
    print(get_columns())
    
    