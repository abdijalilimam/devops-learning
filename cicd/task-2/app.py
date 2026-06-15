#importing Flask class from flask library
from flask import Flask

#build me a Flask app, and it lives in THIS file
app = Flask(__name__)

#when someone visits / (the homepage), run the function below
@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

#this is do that app can be reached 
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)