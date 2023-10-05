# app.py - Flask application for a landing page with email collection
#added to test trigger
#one more

from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit_email():
    email = request.form['email']
    with open('emails.txt', 'a') as f:
        f.write(email + '\n')
    return 'Thanks for submitting your email!'

app.run(host='0.0.0.0', port=5000)