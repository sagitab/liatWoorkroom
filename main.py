from flask import Flask, render_template, request, jsonify
from datetime import datetime
app = Flask(__name__)
current_year = int(datetime.now().year)

@app.route('/')
def index():
     return render_template('home.html',year=current_year)

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000 )