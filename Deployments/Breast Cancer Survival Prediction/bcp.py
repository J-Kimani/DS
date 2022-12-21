import numpy as np
import pickle
import streamlit as st
import base64


# load saved model
def load_saved_artifacts():
    global __model
    
    with open("./cancer.pickle", "rb") as f:
        __model = pickle.load(f)


def predict_survival(age, gender, p1, p2,  p3, p4, ts, Histology, er, pr, her2, serg):
    features = [[age, gender, p1, p2,  p3, p4, ts, Histology, er, pr, her2, serg]]
    
    feat_list = np.array(features, dtype= object)
    pred = __model.predict(feat_list)[0]

    if pred == 1:
        return "Alive"
    else:
        return "Dead"


@st.experimental_memo

def get_img_as_base64(file):
    with open(file, "rb") as f:
        data = f.read()
    return base64.b64encode(data).decode()

img = get_img_as_base64("bcp.jpg")

page_bg_img = f"""
<style>
[data-testid="stAppViewContainer"]> .main {{
background-image: url("data:image/png;base64,{img}");
background-position: center; 
background-repeat: no-repeat;
background-attachment: fixed;
}}

[data-testid= "stHeader"]{{
background: rgba(0,0,0,0);
}}

</style>
"""


def main():
    # background image
    st.markdown(page_bg_img, unsafe_allow_html=True)


    # Title
    st.title('Breast Cancer Survival Prediction')

    # user instructions
    instructions = '<p style="font-family:Courier; color:White; font-size: 20px;">He stands a chance</p>'
    st.markdown(instructions, unsafe_allow_html=True)


    # user input
    age = st.text_input("Input patient's age")
    gender = st.text_input("Patients Gender(MALE: 0, FEMALE: 1")
    p1 = st.text_input("Enter P1 Value")
    p2 = st.text_input("Enter P2 Value")
    p3 = st.text_input("Enter P3 Value")
    p4 = st.text_input("Enter P4 Value")
    ts = st.text_input("Enter tumor stage"": 1, II: 2, III: 3")
    Histology = st.text_input("Patient Histology(Infiltrating Ductal Carcinoma: 1,Infiltrating Lobular Carcinoma: 2, Mucinous Carcinoma: 3")
    er = st.text_input("Patient ER Status(Positive: 1, Negative: 2)")
    pr = st.text_input("Patient PR Status(Positive: 1, Negative: 2)")
    her2 = st.text_input("Patient HER2 Status(Positive: 1, Negative: 2)")
    serg = st.text_input("Surgery Type(Other: 1, Modified Radical Mastectomy: ,Lumpectomy: 3, Simple Mastectomy: 4)")

    # prediction code
    survival = ''

    # prediction button
    if st.button('PREDICT'):
        survival = predict_survival(age, gender, p1, p2,  p3, p4, ts, Histology, er, pr, her2, serg)
    
    st.success(survival)

    # conclusions
    conclusion = '<p style="font-family:Courier; color:White; font-size: 20px;"></p>'
    st.markdown(conclusion, unsafe_allow_html=True)



if __name__ == '__main__':
    load_saved_artifacts()
    main()


