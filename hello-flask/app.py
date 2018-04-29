from flask import Flask, render_template
import random

app = Flask(__name__)

images = [
    "https://media.giphy.com/media/hvPVnM5DQFeLe/giphy.gif",
    "https://media.giphy.com/media/AWNxDbtHGIJDW/giphy.gif", 
    "https://media.giphy.com/media/qyjQsUt0p0TT2/giphy.gif"
]

@app.route('/')
def index():
    url = random.choice(images)
    return render_template('index.html', url=url)

if __name__ == "__main__":
    app.run(host="0.0.0.0")
