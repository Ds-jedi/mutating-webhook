# Use a minimal Python image as the base
FROM python:3.9-slim

# Set environment variables
ENV FLASK_APP=webhook.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=443

# Create a directory for the app
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the webhook server code into the container
COPY webhook.py webhook.py

# Expose the port the app runs on
EXPOSE 443

# Start the Flask app
CMD ["flask", "run", "--cert=cert.pem", "--key=key.pem"]
