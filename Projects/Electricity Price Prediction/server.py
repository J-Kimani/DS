from flask import Flask, request, jsonify
import  util
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


@app.route('/hello')
def hello():
    return 'Hello'

# predict impressions
@app.route('/predict_electricity', methods= ["GET", "POST"])
def predict_elect():
    day = int(request.form['day'])
    month = int(request.form['month'])  
    forcastwind = int(request.form['forcastwind'])
    SLEA = int(request.form['SLEA'])
    SMPEA = int(request.form['SMPEA'])
    temp = int(request.form(['temp']))
    wind = int(request.form['wind'])
    co2 = int(request.form['co2'])
    actualwind = int(request.form['actualwind'])
    load = int(request.form['load'])

    response = jsonify({
        'Impressions': util.predict_electricity(day, month, forcastwind, SLEA, SMPEA, temp, wind, co2, actualwind, load)
    })

    response.headers.add('Access-Control-Allow-Origin', '*')

    return response


if __name__ == "__main__":
    print("Starting Server For Delivery Prediction...")
    util.load_saved_artifacts()
    app.run()