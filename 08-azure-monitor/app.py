from flask import Flask
import logging
import random

app = Flask(__name__)
logging.basicConfig(level=logging.INFO)

@app.route("/")
def home():
    app.logger.info("Homepage hit.")
    return "Hello from Azure!"

@app.route("/health")
def health():
    return "OK", 200

@app.route("/error")
def error():
    app.logger.error("Intentional error triggered.")
    return "Internal Server Error", 500

@app.route("/random")
def random_status():
    if random.choice([True, False]):
        app.logger.warning("Random failure simulated.")
        return "Failure", 500
    return "Success", 200

if __name__ == "__main__":
    app.run(debug=True)
