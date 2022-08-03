from flask import Flask, request, jsonify
import requests
import util
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/hello')
def hello():
    return 'Hello'

@app.route('/order_again', methods= ["GET", "POST"])
def order_again():
    age = int(request.form['age'])
    gender = int(request.form['gender'])
    marital = int(request.form['marital'])
    occupation = int(request.form['occupation'])
    income = int(request.form['income'])
    qualification = int(request.form['qualification'])
    fam_size = int(request.form['fam_size'])
    pin = int(request.form['pin'])
    feedback = int(request.form['feedback'])

    response = jsonify({
        'order again?': util.order_again(age, gender, marital, occupation, income, qualification, fam_size, pin, feedback)
    })

    response.headers.add('Access-Control-Allow-Origin', '*')

    return response



if __name__ == "__main__":
    print("Starting server for delivery prediction")
    util.load_saved_artifacts()
    app.run()