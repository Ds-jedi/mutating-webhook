from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/mutate', methods=['POST'])
def mutate_pod():
    admission_review = request.json

    # Add your logic here to modify the pod spec and add labels

    admission_response = {
        "allowed": True,
        "patchType": "JSONPatch",
        "patch": "[{ \"op\": \"add\", \"path\": \"/metadata/labels/label-key\", \"custom-key\": \"custom-label-value\" }]"
    }

    return jsonify({"response": admission_response})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=443, ssl_context=('cert.pem', 'key.pem'))
