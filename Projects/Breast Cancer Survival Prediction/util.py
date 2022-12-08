import pickle
import numpy as np
import warnings
warnings.filterwarnings('ignore')


def load_saved_artifacts():
    print("loading saved artifacts...start")
    global __model


    with open("c:/Users/Administrator/Documents/data science/Projects/Breast Cancer Survival Prediction/cancer.pickle", "rb") as f:
        __model = pickle.load(f)

    print("loading saved artifacts...done")





def predict_survival(age, gender, p1, p2,  p3, p4, ts, Histology, er, pr, her2, st):
    features = [[age, gender, p1, p2,  p3, p4, ts, Histology, er, pr, her2, st]]

    pred = __model.predict(features)[0]

    if pred == 1:
        return "Alive"
    else:
        return "Dead"



if __name__ == '__main__':
    load_saved_artifacts()
    print(predict_survival(36, 1, 0.080353, 0.42638, 0.54715, 0.273680, 3, 1, 1 , 1, 2, 2))