from flask import Flask, jsonify, request, session, redirect, url_for
import jwt
from datetime import datetime, timedelta
from functools import wraps
from pymongo import MongoClient


cluster = MongoClient("mongodb+srv://tiernanjesrani:IvyKallie2023@cluster0.ahxwwek.mongodb.net/?retryWrites=true&w=majority", ssl = True)
db = cluster["SharedCalendar"]
users = db["Users"]

app = Flask(__name__)
app.config['SECRET_KEY'] = '\x02\x1bV\\\x128\xcd0g\x87\xcd\x0b'

@app.route("/", methods=["POST", "GET"])
def home():
    t = request.args.get('t')
    test = [{'test':'success', 'name': 'Tiernan'}]
    return jsonify({'token': t})

@app.route("/login", methods=["POST", "GET"])
def login():
    data = request.get_json()

    username = data.get("username")
    password = data.get("password")

    print("Checking for user...")

    result = users.find_one({"username":username, "password": password})

    print("Checked")

    if result:
        print("Successfully logged in")
        session['logged_in'] = True
        token = jwt.encode({
            'user': username,
            'expiration': str(datetime.utcnow() + timedelta(seconds = 120))
        }, 
            app.config['SECRET_KEY'])
        #return redirect(url_for('home', t = token))
        return jsonify({'token':token})

    else :
        print("Incorrect username or password")

    return "Success"

@app.route("/signup", methods=["POST", "GET"])
def signup():
    data = request.get_json()

    username = data.get("username")
    password = data.get("password")

    print("Checking for user...")

    result = users.find_one({"username":username})

    print("Checked")
    if not result:
        users.insert_one({"username": username, "password": password})
        print("User Added")

    else:
        print("User Exists")
    

    return "S"

if __name__ == "__main__":
    app.run(debug=True)

