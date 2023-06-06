import pickle
from sklearn.feature_extraction.text import CountVectorizer
import warnings
warnings.filterwarnings("ignore")


def load():
    print("Loading models...start")
    global __model
    global __cv

    with open("C:/Users/Administrator/Documents/data science/Projects/Language Detection/ld.pickle", "rb") as f:
        __model = pickle.load(f)
    
    with open('C:/Users/Administrator/Documents/data science/Projects/Language Detection/count_vectorizer.pkl', 'rb') as f:
        __cv = pickle.load(f)

    print("Loading models...done")

def det_lang(input):
    data = __cv.transform([input]).toarray()
    output = __model.predict(data)
    return f"{output[0]}"
    

if __name__ == "__main__":
    load()
    print(det_lang("help"))