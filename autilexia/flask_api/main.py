from flask import Flask, request, jsonify
from pymongo import MongoClient
from werkzeug.security import generate_password_hash, check_password_hash
import random
import string

app = Flask(__name__)

password = "lRHs3hW6JsfA4jof"
user = "dbproject1234567890"

# MongoDB Atlas Connection
client = MongoClient("mongodb+srv://dbproject1234567890:lRHs3hW6JsfA4jof@cluster0.mnx82.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")  # Replace with your Atlas connection string
db = client["autilexia"]  # Replace with your database name
user_collection = db["users"]  # Replace with your collection name

@app.route("/", methods=["POST", "GET"])
def main():
    try:
        # Check if the database is accessible
        client.admin.command("ping")
        init = True
    except Exception as e:
        print(f"Error connecting to MongoDB Atlas: {e}")
        init = False
    return jsonify({"Initialized": init})

@app.route("/login", methods=["POST"])
def login():
    # Extract username and password from the request
    data = request.json
    username = data.get("username")
    password = data.get("password")

    if not username or not password:
        return jsonify({"error": "Username and password are required"}), 400

    # Find user in the database
    user = user_collection.find_one({"username": username})
    if user and check_password_hash(user["password"], password):
        return jsonify({"message": "Login successful", "error": None}), 200
    else:
        return jsonify({"Logged In": False, "error": "Invalid credentials"}), 401

@app.route("/register", methods=["POST"])
def register():
    # Extract username and password from the request
    data = request.json
    username = data.get("username")
    password = data.get("password")

    if not username or not password:
        return jsonify({"error": "Username and password are required"}), 400

    # Check if user already exists
    if user_collection.find_one({"username": username}):
        return jsonify({"error": "User already exists"}), 400

    # Hash the password and create a random token
    hashed_password = generate_password_hash(password)
    token = generate_random_token()

    # Save the user with token field in the database
    user_collection.insert_one({
        "username": username,
        "password": hashed_password,
        "token": token,
    })
    return jsonify({"message": "Registration successful", "error": None, "token": token}), 200

@app.route("/get_token", methods=["GET"])
def get_token():
    # Extract username from the request
    username = request.args.get("username")
    
    if not username:
        return jsonify({"error": "Username is required"}), 400

    # Find user in the database
    user = user_collection.find_one({"username": username})
    
    if user:
        return jsonify({"username": username, "token": user["token"]}), 200
    else:
        return jsonify({"error": "User not found"}), 404

@app.route("/update_user", methods=["PUT"])
def update_user():
    data = request.json
    username = data.get("username")
    updates = data.get("updates")

    if not username or not updates:
        return jsonify({"error": "Username and updates are required"}), 400

    result = user_collection.update_one({"username": username}, {"$set": updates})

    if result.matched_count > 0:
        return jsonify({"message": "User updated successfully"}), 200
    else:
        return jsonify({"error": "User not found"}), 404

@app.route("/delete_user", methods=["DELETE"])
def delete_user():
    data = request.json
    username = data.get("username")

    if not username:
        return jsonify({"error": "Username is required"}), 400

    result = user_collection.delete_one({"username": username})

    if result.deleted_count > 0:
        return jsonify({"message": "User deleted successfully"}), 200
    else:
        return jsonify({"error": "User not found"}), 404

# Function to generate a random token (could be replaced with a more secure method)
def generate_random_token(length=32):
    characters = string.ascii_letters + string.digits
    return ''.join(random.choice(characters) for _ in range(length))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
