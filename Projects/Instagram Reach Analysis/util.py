import json
import pickle
import numpy as np
import warnings
warnings.filterwarnings('ignore')


def load_saved_artifacts():
    print("loading saved artifacts...start")
    global __data_columns
    global __model

    with open("C:/Users/Administrator/Documents/data science/Projects/Instagram Reach Analysis/artifacts/columns.json", 'r') as f:
        __data_columns = json.load(f)["data_columns"]
    
    with open("C:/Users/Administrator/Documents/data science/Projects/Instagram Reach Analysis/artifacts/insta.pickle", "rb") as f:
        __model = pickle.load(f)

    print("loading saved artifacts...done")


def get_columns():
    return __data_columns


def pred_imp(save, comment, share, like, prof_visit, follow):
    x = np.zeros(len(__data_columns))

    x[0] = save
    x[1] = comment
    x[2] = share
    x[3] = like
    x[4] = prof_visit
    x[5] = follow
    
    imp = np.round(__model.predict([x])[0])

    return imp
    
    


if __name__ == '__main__':
    load_saved_artifacts()
    print(get_columns())
    print(pred_imp(233, 620, 9, 282, 165, 54))