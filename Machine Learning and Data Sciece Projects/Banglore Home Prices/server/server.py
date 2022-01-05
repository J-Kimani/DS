from flask import Flask, request, jsonify
import util
from flask_cors import CORS

# allows the server to handle http requests
app = Flask(__name__)
CORS(app)


# requires 2 routines
#Function Decorators
@app.route('/hello')
def hello():
	return 'Hello'

# 1.returns location in banglore
# exposing http endpoint
@app.route('/get_location_names', methods= ['GET'])
def get_location_names():
    response = jsonify({
        'locations': util.get_location_names()
    })
    response.headers.add('Acess-Control-Allow-Origin', '*')
    return response

# predict home price endpoint
@app.route('/predict_home_price', methods=['GET', 'POST'])
def predict_home_price():
    total_sqft = float(request.form['total_sqft'])
    location = request.form['location']
    bhk = int(request.form['bhk'])
    bath = int(request.form['bath'])

    response = jsonify({
        'estimated_price': util.get_estimate_price(location, total_sqft, bhk, bath)
    })

    response.headers.add('Acess-Control-Allow-Origin', '*')

    return response

if __name__ == "__main__":
    print("Starting Python flask Server For Home Price Prediction...")
    util.load_saved_artifact()
    app.run()