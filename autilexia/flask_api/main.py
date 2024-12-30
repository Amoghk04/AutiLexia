from flask import Flask, request, jsonify
from pymongo import MongoClient
from datetime import datetime
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)

# MongoDB Atlas Connection
client = MongoClient("mongodb+srv://dbproject1234567890:lRHs3hW6JsfA4jof@cluster0.mnx82.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")
db = client["autilexia"]
user_collection = db["users"]

@app.route("/", methods=["GET"])
def main():
    try:
        client.admin.command("ping")
        init = True
    except Exception as e:
        print(f"Error connecting to MongoDB Atlas: {e}")
        init = False
    return jsonify({"Initialized": init})

@app.route("/register", methods=["POST"])
def register():
    data = request.json
    username = data.get("username")
    password = data.get("password")
    if not username or not password:
        return jsonify({"error": "Username and password are required"}), 400
    if user_collection.find_one({"username": username}):
        return jsonify({"error": "User already exists"}), 400
    hashed_password = generate_password_hash(password)
    user_collection.insert_one({
        "username": username,
        "password": hashed_password,
        "tokens": 0,
        "modules": [],
        "multiplier": 1
    })
    return jsonify({"message": "Registration successful"}), 200

@app.route("/login", methods=["POST"])
def login():
    data = request.json
    username = data.get("username")
    password = data.get("password")
    if not username or not password:
        return jsonify({"error": "Username and password are required"}), 400
    user = user_collection.find_one({"username": username})
    if user and check_password_hash(user["password"], password):
        return jsonify({"message": "Login successful"}), 200
    return jsonify({"error": "Invalid credentials"}), 401


@app.route("/updateCompletedDc", methods=["PUT"])
def update_completed_dc():
    data = request.json
    name = data.get("name")
    completed_dc = data.get("completed_dc")
    if not name or completed_dc is None:
        return jsonify({"error": "Name and completed_dc are required"}), 400
    
    result = user_collection.update_one({"name": name}, {"$set": {"completed_dc": completed_dc}})
    if result.matched_count > 0:
        return jsonify({"message": "completed_dc updated successfully"}), 200
    return jsonify({"error": "User not found"}), 404

@app.route("/updateMultiplier", methods=["PUT"])
def update_multiplier():
    data = request.json
    name = data.get("name")
    multiplier = data.get("multiplier")
    if not name or multiplier is None:
        return jsonify({"error": "Name and multiplier are required"}), 400
    
    result = user_collection.update_one({"name": name}, {"$set": {"multiplier": multiplier}})
    if result.matched_count > 0:
        return jsonify({"message": "Multiplier updated successfully"}), 200
    return jsonify({"error": "User not found"}), 404

@app.route("/updateLastLogin", methods=["PUT"])
def update_last_login():
    data = request.json
    name = data.get("name")
    last_login = data.get("last_login")
    if not name or not last_login:
        return jsonify({"error": "Name and last_login are required"}), 400
    
    result = user_collection.update_one(
        {"name": name},
        {"$set": {"last_login": last_login, "completed": 0, "multiplier": 1}}
    )
    if result.matched_count > 0:
        return jsonify({"message": "Last login updated successfully"}), 200
    return jsonify({"error": "User not found"}), 404

@app.route("/updateTokens", methods=["PUT"])
def update_tokens():
    data = request.json
    name = data.get("name")
    tokens = data.get("tokens")
    if not name or tokens is None:
        return jsonify({"error": "Name and tokens are required"}), 400
    
    result = user_collection.update_one({"name": name}, {"$set": {"tokens": tokens}})
    if result.matched_count > 0:
        return jsonify({"message": "Tokens updated successfully"}), 200
    return jsonify({"error": "User not found"}), 404

@app.route("/updateLastDailyChallenge", methods=["PUT"])
def update_last_daily_challenge():
    data = request.json
    name = data.get("name")
    last_challenge = data.get("last_challenge")
    if not name:
        return jsonify({"error": "Name is required"}), 400
    
    result = user_collection.update_one({"name": name}, {"$set": {"last_challenge": last_challenge}})
    if result.matched_count > 0:
        return jsonify({"message": "Last daily challenge updated successfully"}), 200
    return jsonify({"error": "User not found"}), 404

@app.route("/updateCompletedModules", methods=["PUT"])
def update_completed_modules():
    data = request.json
    name = data.get("name")
    completed = data.get("completed")
    if not name or completed is None:
        return jsonify({"error": "Name and completed are required"}), 400
    
    result = user_collection.update_one({"name": name}, {"$set": {"completed": completed}})
    if result.matched_count > 0:
        return jsonify({"message": "Completed modules updated successfully"}), 200
    return jsonify({"error": "User not found"}), 404

@app.route("/user", methods=["GET"])
def get_user():
    name = request.args.get("name")
    print(name)
    if not name:
        return jsonify({"error": "Name is required"}), 400

    user = user_collection.find_one({"username": name}, {"_id": 0, "password": 0})
    if user:
        return jsonify(user), 200
    return jsonify({"error": "User not found"}), 404

@app.route("/getTokens", methods=["GET"])
def get_tokens():
    username = request.args.get("username")
    if not username:
        return jsonify({"error": "Username is required"}), 400

    user = user_collection.find_one({"username": username}, {"_id": 0, "tokens": 1})
    if user:
        return jsonify({"tokens": user.get("tokens", 0)}), 200
    return jsonify({"error": "User not found"}), 404

if __name__ == "__main__":
    app.run(debug=True)
