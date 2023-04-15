from flask import Flask, request, jsonify
import  util
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


@app.route('/hello')
def hello():
    return 'Hello'

# predict impressions
@app.route('/predict_price', methods= ["GET", "POST"])
def predict_impression():
    save = int(request.form['save'])
    comment = int(request.form['comment'])  
    share = int(request.form['share'])
    like = int(request.form['like'])
    prof_visit = int(request.form['prof_visit'])
    follow = int(request.form['follow'])

    response = jsonify({
        'Impressions': util.predict_electricity(day, month, forcastwind, SLEA, SMPEA, temp, wind, co2, actualwind, load)
    })

    response.headers.add('Access-Control-Allow-Origin', '*')

    return response


if __name__ == "__main__":
    print("Starting Server For Delivery Prediction...")
    util.load_saved_artifacts()
    app.run()