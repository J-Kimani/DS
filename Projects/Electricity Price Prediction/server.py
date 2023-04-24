from flask import Flask, request, jsonify
import util

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    day = int(request.json['day'])
    month = int(request.json['month'])
    forcastwind = float(request.json['forcastwind'])
    SLEA = float(request.json['SLEA'])
    SMPEA = float(request.json['SMPEA'])
    temp = float(request.json['temp'])
    wind = float(request.json['wind'])
    co2 = float(request.json['co2'])
    actualwind = float(request.json['actualwind'])
    load = float(request.json['load'])
    
    price = util.predict_electricity(day, month, forcastwind, SLEA, SMPEA, temp, wind, co2, actualwind, load)
    
    return jsonify({'price': price})

if __name__ == '__main__':
    util.load_saved_artifacts()
    app.run(debug=True, port= 5000)
