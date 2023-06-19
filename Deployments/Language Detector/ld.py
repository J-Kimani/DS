import numpy as np
import pickle
import streamlit as st
import base64

# load saved models
def load():
    global __model
    global __cv

    with open("./ld.pickle", "rb") as f:
        __model = pickle.load(f)
    
    with open('./count_vectorizer.pkl', 'rb') as f:
        __cv = pickle.load(f)

def det_lang(input):
    data = __cv.transform([input]).toarray()
    output = __model.predict(data)
    return f"{output[0]}" 


def get_img_as_base64(file):
    with open(file, "rb") as f:
        data = f.read()
    return base64.b64encode(data).decode()

img = get_img_as_base64("ld3.jpg")


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
    #  background image
    st.markdown(page_bg_img, unsafe_allow_html=True)


    # Title
    st.title("Language Detector")

    # user instructions
    instructions = '<p style="font-family:Courier; color:White; font-size: 20px;">Break the language barrier with ease - Let our app detect with expertise!</p>'
    st.markdown(instructions, unsafe_allow_html=True)

    #user input
    user = st.text_input("Enter a phrase")

    detect = ''

    if st.button("DETECT"):
        detect = det_lang(user)
    
    st.success(detect)

    
    conclusion = '<p style="font-family:Courier; color:White; font-size: 20px;"></p>'
    st.markdown(conclusion, unsafe_allow_html=True)


if __name__ == "__main__":
    load()
    main()