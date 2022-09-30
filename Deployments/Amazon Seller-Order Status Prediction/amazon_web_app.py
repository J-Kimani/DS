import json
import numpy as np
import pickle
import streamlit as st
import base64


# load saved model
def load_saved_artifacts():
    global __data_columns
    global __model

    with open("./columns.json", 'r') as f:
        __data_columns = json.load(f)["data_columns"]
    
    with open("./amazon.pickle", "rb") as f:
        __model = pickle.load(f)


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
        return 'Delivered to Buyer'
    else:
        return 'Returned to seller'

@st.experimental_memo

def get_img_as_base64(file):
    with open(file, "rb") as f:
        data = f.read()
    return base64.b64encode(data).decode()

img = get_img_as_base64("amazon-arrow-logo-3959za0tc79lrbms.jpg")

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
    st.title('Amazon Order Prediction')

    # user instructions
    instructions = '<p style="font-family:Courier; color:White; font-size: 20px;">Please input values from key</p>'
    st.markdown(instructions, unsafe_allow_html=True)


    # user input
    city = st.text_input('Ship City(USE KEY) 0-73')
    sku = st.text_input('SKU(USE KEY) 0-53')
    quantity = st.text_input('Quantity(Cannot be zero)')
    total = st.text_input('Total Cost')
    fee = st.text_input('Fee Charged')
    cod = st.text_input('Cash on delivery(Yes:1, NO:0)')

    # prediction code
    order = ''

    # prediction button
    if st.button('Order Status'):
        order = delivery(city, sku, quantity, total, fee, cod)
    
    st.success(order)


if __name__ == '__main__':
    load_saved_artifacts()
    main()


