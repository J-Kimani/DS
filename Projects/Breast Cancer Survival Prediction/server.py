from flask import Flask, request, jsonify
import  util
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


@app.route('/hello')
def hello():
    return 'Hello'

# predict impressions
@app.route('/pred_survival', methods= ["GET", "POST"])
def pred_survival():
    age = int(request.form['age'])
    gender = int(request.form['gender'])  
    p1 = float(request.form['p1'])
    p2 = float(request.form['p2'])
    p3 = float(request.form['p3'])
    p4 = float(request.form['p4'])
    ts = int(request.form['ts'])
    Histology = int(request.form['Histology'])
    er = int(request.form['er'])
    pr = int(request.form['pr'])
    her2 = int(request.form['her2'])
    st = int(request.form['st'])
    
    response = jsonify({
        'PS': util.predict_survival(age, gender, p1, p2,  p3, p4, ts, Histology, er, pr, her2, st)
    })

    response.headers.add('Access-Control-Allow-Origin', '*')

    return response


if __name__ == "__main__":
    print("Starting Server For Survival Prediction...")
    util.load_saved_artifacts()
    app.run()