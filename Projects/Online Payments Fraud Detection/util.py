import json
import pickle
import numpy as np
import warnings
warnings.filterwarnings('ignore')


def load_saved_artifacts():
    print("loading saved artifacts...start")
    global __model


    with open("C:/Users/Administrator/Documents/data science/Projects/Online Payments Fraud Detection/artifacts/fraud.pickle", "rb") as f:
        __model = pickle.load(f)

    print("loading saved artifacts...done")





def Fraud(step, type, amount, old_origin, new_origin, old_dest, new_dest):
    x = np.zeros(7)

    x[0]: step
    x[1]: type
    x[2]: amount
    x[3]: old_origin
    x[4]: new_origin
    x[5]: old_dest
    x[6]: new_dest

    fr = __model.predict([x])[0]


    if fr == 1:
        return "Fraudulent transaction"
    else:
        return "Normal transaction"



if __name__ == '__main__':
    load_saved_artifacts()
    print(Fraud(1, 3, 9839.64, 170136, 160296.36, 1, 488885))