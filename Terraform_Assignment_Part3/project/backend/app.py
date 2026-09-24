from multiprocessing.util import debug

from flask import Flask, jsonify, request, render_template, redirect, url_for

import json

from dotenv import load_dotenv

import os

import pymongo

app = Flask(__name__)

load_dotenv()

MONGO_URI = os.getenv('MONGO_URI')

if not MONGO_URI:

    raise ValueError("MONGO_URI is not set in the .env file")


try:

    client = pymongo.MongoClient(MONGO_URI)

    client.admin.command('ping')

    db = client.test

    collection = db['Flask']

except Exception as e:

    print("MongoDB connection failed:", e)

    db = None

    collection = None


@app.route('/')

def index():

    return render_template('index.html')


@app.route('/api', methods=['GET'])

def api():

    with open('data.json', 'r') as file:

        data = json.load(file)

    return jsonify(data)


@app.route('/submit', methods=['GET', 'POST'])
def submit():
            if request.method == 'GET':
                return render_template('index.html')
    
            try:
                name = request.form.get('name', '').strip()
                password = request.form.get('password', '').strip()
    
                if not name or not password:
                    return render_template(
                        'index.html',
                        error='Name and password are required'
                    )
    
                if collection is None:
                    return render_template(
                        'index.html',
                        error='MongoDB connection failed. Please try again later.'
                    )
    
                data = {
                    'name': name,
                    'password': password
                }
    
                collection.insert_one(data)
    
                return redirect(url_for('success'))
    
            except Exception as e:
                return render_template(
                    'index.html',
                    error=str(e)
                )


@app.route('/success')

def success():

    return render_template('success.html')



@app.route('/todo')

def todo():
    
    return render_template('todo.html')



@app.route('/submittodoitem', methods=['POST'])
def submit_todo_item():
    
    try:
        
        item_name = request.form.get('itemname', '').strip()
        
        item_description = request.form.get('itemdescription', '').strip()

        if not item_name or not item_description:
            return render_template(
                'todo.html',
                error='Item name and description are required'
            )

        if db is None:
            
            return render_template(
                'todo.html',
                error='MongoDB connection failed. Please try again later.'
            )

        todo_data = {
            'itemname': item_name,
            
            'itemdescription': item_description
        }

        db['todo'].insert_one(todo_data)

        return redirect(url_for('success'))

    except Exception as e:
        return render_template(
            'todo.html',
            error=str(e)
        )


if __name__ == '__main__':

    app.run(host='0.0.0.0', port=5000,  debug=True)