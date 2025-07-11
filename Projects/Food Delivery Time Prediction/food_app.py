import streamlit as st
import numpy as np
from math import radians, sin, cos, sqrt, atan2

# ------------------------------
# Function to calculate Haversine distance
# ------------------------------
def calc_distance(lat1, lon1, lat2, lon2):
    R = 6371  # Radius of the Earth in kilometers
    dlat = radians(lat2 - lat1)
    dlon = radians(lon2 - lon1)
    a = sin(dlat / 2) ** 2 + cos(radians(lat1)) * cos(radians(lat2)) * sin(dlon / 2) ** 2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c

# ------------------------------
# Streamlit UI
# ------------------------------
st.title("Food Delivery Time Prediction")

# Age
age = st.number_input("Delivery Person Age:", min_value= 18, max_value= 65, value= 30)

# Rating
rating = st.slider("Delivery Person Rating", min_value= 1.0, max_value= 5.0, value= 4.0, step= 0.1)

# Resturant Location
st.subheader("Restaurant Location")
rest_lat = st.number_input("Restaurant Latitude:", format="%.6f", value= 12.9715987)
rest_lon = st.number_input("Restaurant Longitude:", format="%.6f", value= 77.594566)

# Delivery Location
st.subheader("Delivery Location")
deliv_lat = st.number_input("Delivery Latitude:", format="%.6f", value= 12.2958104)
deliv_lon = st.number_input("Delivery Longitude:", format="%.6f", value= 76.6393805)

# Calculate distance
if st.button("Calculate Distance"):
    distance = calc_distance(rest_lat, rest_lon, deliv_lat, deliv_lon)
    st.write(f"Distance: {distance:.2f} km")
