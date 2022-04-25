from flask import Flask, request, jsonify
import  util
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


@app.route('/hello')
def hello():
    return 'Hello'

# predict delivery
@app.route('/predict_delivery', methods= ["GET", "POST"])
def predict_delivery():
    city = int(request.form['city'])
    sku = int(request.form['sku'])
    quantity = int(request.form['quantity'])
    total = float(request.form['total'])
    fee = float(request.form['fee'])
    cod = int(request.form['cod'])

    response = jsonify({
        'delivery': util.delivery(city, sku, quantity, total, fee, cod)
    })

    response.headers.add('Access-Control-Allow-Origin', '*')

    return response


if __name__ == "__main__":
    print("Starting Server For Delivery Prediction...")
    util.load_saved_artifacts()
    app.run()