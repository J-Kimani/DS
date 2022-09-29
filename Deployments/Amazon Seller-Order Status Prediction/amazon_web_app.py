import json
import numpy as np
import pickle
import streamlit as st



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

def main():
    # Title
    st.title('Amazon Order Prediction')

    # user input
    city = st.text_input('City')
    sku = st.text_input('SKU')
    quantity = st.text_input('Quantity')
    total = st.text_input('Total Cost')
    fee = st.text_input('Fee Charged')
    cod = st.text_input('COD')

    # prediction code
    order = ''

    # prediction button
    if st.button('Order Status: '):
        order = delivery(city, sku, quantity, total, fee, cod)
    
    st.success(order)


if __name__ == '__main__':
    load_saved_artifacts()
    main()


