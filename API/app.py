from flask import Flask, request

app = Flask(__name__)

# The API is listening for /hello
@app.route('/hello')
def helloInternet():
    return "Hello World!"

# This route is now listening to /name
# This will only trigger when /name is at the end of the path
# There are 4 main types of HTTP Methods, GET, POST, PUT, DELETE

# The Default method is GET, but if we want to tell it to wait for a POST, PUT, DELETE we can specify that
@app.route('/name')
def helloName():
    return "Hello Reece"

# Waiting for a POST request with a path of /name
@app.route('/post', methods=['POST'])
def namePost():
    return "Post Request!"

@app.route('/put', methods=['PUT'])
def putFunc():
    return "Put Request!"

@app.route('/delete', methods=['DELETE'])
def deleteFunc():
    return "Delete Request!"

@app.route('/demo', methods=['POST', 'PUT', 'GET','DELETE'])
def demoFunc():
    if request.method == 'POST':
        return "POST Request"
    
    if request.method == 'GET':
        return "GET Request"
    
    else:
        return "Other request"

@app.route('/comment', methods=['POST', 'PUT', 'GET', 'DELETE'])
def commentFunc():
    if request.method == 'POST':
        return "Adding comment to forum"
    
    if request.method == 'DELETE':
        return "Deleting comment"

# Query Params /films?rating=good
# URL Params   /films/73frfyufgrerg (IDs)
# Request Body { 'name' : "Reece", 'email':"Reece.elder@qa.com" }

# Anything in the <> our URL param
@app.route('/hello/<name>')
def helloPerson(name): 
    param = name
    return name

# /person?favcolour=red
@app.route('/person')
def personQuery():
    data = request.args
    return data

# /penguin
@app.route('/penguin', methods =['POST', 'GET'])
def penguinFunc():
    if request.method == 'POST':
        data = request.get_json()
        return data
    else:
        return "Penguin Data"

if __name__=='__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
