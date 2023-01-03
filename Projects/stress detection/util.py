import pickle
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer
import warnings
warnings.filterwarnings("ignore")


def load():
    print("Loading models...start")
    global __model
    global __cv

    with open("C:/Users/Administrator/Documents/data science/Projects/stress detection/stress.pickle", "rb") as f:
        __model = pickle.load(f)
    
    with open('C:/Users/Administrator/Documents/data science/Projects/stress detection/count_vectorizer.pkl', 'rb') as f:
        __cv = pickle.load(f)

    print("Loading models...done")

def det_stress(user):
    data = __cv.transform([user]).toarray()
    prob = np.round(__model.predict_proba(data) * 100, 2).tolist()[0]

    return f"not stressed: {prob[0]}, stressed: {prob[1]}" 

if __name__ == "__main__":
    load()
    print(det_stress("Sometime I feel like I need some help"))
