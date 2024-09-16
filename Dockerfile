# Step 1: Use a base image
FROM python:3.9-slim

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the requirements.txt file into the container
COPY requirements.txt .

# Step 4: Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the rest of your application code into the container
COPY . .

# Step 6: Expose the port that Flask uses (default 5000)
EXPOSE 5000

# Step 7: Command to run the Flask app
CMD ["python", "app.py"]