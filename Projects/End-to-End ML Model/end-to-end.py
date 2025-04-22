import streamlit as st
import pandas as pd
import pickle

# Load the pre-trained model
model_path = 'C:/Users/HomePC/Documents/Data Science/Projects/End-to-End ML Model/real_estate_model.pkl'
with open(model_path, 'rb') as file:
    model = pickle.load(file)

# App title
st.title("🏠 Real Estate Price Prediction")
st.markdown("Enter the property details below to predict the **house price per unit area.**")

# Input form
with st.form(key='prediction_form'):
    distance_to_mrt = st.number_input("Distance to the nearest MRT station (in meters)", min_value=0.0, step=10.0)
    num_convenience_stores = st.number_input("Number of convenience stores", min_value=0)
    latitude = st.number_input("Latitude", format="%.6f")
    longitude = st.number_input("Longitude", format="%.6f")
    
    submit = st.form_submit_button(label='Predict Price')

# Prediction
if submit:
    if None not in [distance_to_mrt, num_convenience_stores, latitude, longitude]:
        # Ensure column names match those used during training
        features = pd.DataFrame([[distance_to_mrt, num_convenience_stores, latitude, longitude]],
            columns=['Distance to the nearest MRT station', 'Number of convenience stores', 'Latitude', 'Longitude'])
        
        prediction = model.predict(features)[0]
        st.success(f"💰 Predicted House Price: {prediction:.2f} per unit area")
    else:
        st.warning("Please fill in all input fields.")
