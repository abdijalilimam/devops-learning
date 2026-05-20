import os
from flask import Flask, render_template  # Keeps your imports intact
import redis 

app = Flask(__name__)
redis_host = os.getenv('REDIS_HOST', 'redis')
redis_port = int(os.getenv('REDIS_PORT', 6379))

r = redis.Redis(host=redis_host, port=redis_port)

@app.route('/')
def welcome():
    # 1. Get the current counter value from Redis so we can display it on the homepage
    current_count = r.get('Visits')
    count_val = int(current_count) if current_count else 0
    
    # 2. Render the HTML file and pass the variables into it
    return render_template('index.html', count=count_val, page='home')

@app.route('/count')
def count():
    # 1. Increment the count in Redis like before
    count_val = r.incr('Visits')
    
    # 2. Render the HTML file with the updated number
    return render_template('index.html', count=count_val, page='count')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5002)
