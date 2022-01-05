import json
import pickle
import numpy as np

# create 3 global variables
__locations = None
__data_columns = None
__model = None

def get_estimate_price(location, sqft,bhk,bath):
    #defiine and create an array
    try:
        loc_index = __data_columns.index(location.lower())
    except:
        loc_index = -1
    a = np.zeros(len(__data_columns))
    a[0] = sqft
    a[1] = bath
    a[2] = bhk
    if loc_index >= 0:
        a[loc_index] = 1

    return round(__model.predict([a])[0],2)

def get_location_names():
    global __locations
    return  __locations

def load_saved_artifact():
    print("loading saved artifacts...start")
    # declare global vsriables in routine
    global __data_columns
    global __locations

    #open columns.json
    with open("./artifacts/columns.json", 'r') as f:
        __data_columns = json.load(f)['data_columns']
        # use python index slicing to remove column heads
        __locations = __data_columns[3:]  #first 3 columns are sqft, bath, bhk
    global __model
    #open pickle file
    with open("./artifacts/banglore_home_prices.pickle", "rb") as f:
        __model = pickle.load(f)

    print("loading saved artifacts...done")

def get_data_columns():
    return __data_columns


if __name__ == '__main__':
    load_saved_artifact()
    print(get_location_names())
    print(get_estimate_price('1st Phase Jp Nagar', 1000, 3, 3))
    print(get_estimate_price('1st Phase Jp Nagar', 1000, 2, 2))
    print(get_estimate_price('Kalhalli', 1000, 2, 2)) #other location
    print(get_estimate_price('Ejipura', 1000, 2, 2)) #other location