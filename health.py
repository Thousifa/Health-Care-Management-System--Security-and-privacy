from flask import Flask, render_template, request, redirect, url_for, session

import mysql.connector
import os
import hashlib
import json


app = Flask(__name__, template_folder='./')
app.secret_key = '1234'

# Database initialization
def init_db():
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
    )

    cursor = connection.cursor()
    cursor.execute('CREATE DATABASE IF NOT EXISTS healthcare')
    cursor.execute('USE healthcare')

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INT AUTO_INCREMENT PRIMARY KEY,
            username VARCHAR(255) NOT NULL,
            password VARCHAR(255) NOT NULL
        )
    ''')

    connection.commit()
    cursor.close()
    connection.close()


#function to hash passwords 
def hash_password(password):
   password_bytes = password.encode('utf-8')
   hash_object = hashlib.sha256(password_bytes)
   return hash_object.hexdigest()

# Function to create a new user
def create_user(username, password, user_group='R'):
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='healthcare'
    )

    cursor = connection.cursor()

    hashed_password = hashlib.sha256(password.encode()).hexdigest()
    cursor.execute('INSERT INTO users (username, password, user_group) VALUES (%s, %s, %s)', (username, hashed_password, user_group))

    connection.commit()
    cursor.close()
    connection.close()



# Function to check login credentials and user group
def check_credentials(username, password):
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='healthcare'
    )

    cursor = connection.cursor()

    cursor.execute('SELECT * FROM users WHERE username = %s', (username,))
    user = cursor.fetchone()

    connection.close()

    if user and hashlib.sha256(password.encode()).hexdigest() == user[2]:
        return True, user[3]  # Return True and user group
    else:
        return False, None


# Routes
@app.route('/')
def home():
    if 'username' in session:
        return f'Hello, {session["username"]}! <a href="/logout">Logout</a>'
    return 'You are not logged in. <a href="/login">Login</a> or <a href="/register">Register</a>'


# Route for handling login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        success, user_group = check_credentials(username, password)

        if success:
            session['username'] = username
            session['user_group'] = user_group
            return redirect(url_for('dashboard'))
        else:
            return render_template('login.html', error='Invalid username or password')

    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('home'))

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user_group = request.form['user_group']

        # Check if the username is already taken
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='healthcare'
        )
        cursor = connection.cursor()
        cursor.execute('SELECT * FROM users WHERE username = %s', (username,))
        existing_user = cursor.fetchone()
        connection.close()

        if existing_user:
            return 'Username already taken. Please choose another username.'

        # If username is not taken, create a new user        
        create_user(username, password, user_group)
        return 'Registration successful! <a href="/login">Login</a>'

    return render_template('./register.html')

def get_user_attributes(user_group):
    if user_group == 'H':
        # Full access group
        return 'first_name, last_name, gender, age, weight, height, health_history'
    else:
        # Restricted access group
        return 'gender, age, weight, height, health_history'
    
        return ''

# Function to get user group
def get_user_group(username):
    connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='healthcare'
        )
    cursor = connection.cursor()

    cursor.execute('SELECT user_group FROM users WHERE username = %s', (username,))
    user_group = cursor.fetchone()[0]

    cursor.close()

    return user_group


# Route to display the dashboard
@app.route('/dashboard')
def dashboard():
    if 'username' not in session:
        return redirect(url_for('login'))

    # Get user group
    user_group = get_user_group(session['username'])

    # Get allowed attributes based on user group
    allowed_attributes = get_user_attributes(user_group)

    # Construct the SQL query
    query = f"SELECT {allowed_attributes} FROM healthcare_data"

    # Execute the query
    connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='healthcare'
        )
    cursor = connection.cursor()
   
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()

    
    data_json = data

    return render_template('dashboard.html', data=data_json, allowed_attributes=allowed_attributes)



# Route for handling queries
@app.route('/query')
def query():
    if 'username' in session and 'user_group' in session:
        user_group = session['user_group']
        attributes = get_user_attributes(user_group)

        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='healthcare'
        )

        cursor = connection.cursor()

        # Fetch data based on allowed attributes and user group
        cursor.execute(f'SELECT {attributes} FROM healthcare_data')
        query_result = cursor.fetchall()

        connection.close()

        return f'Query Result: {query_result}'
    else:
        return 'You are not logged in. <a href="/login">Login</a>'

if __name__ == '__main__':
    init_db()
    app.run(debug=True)
