# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set environment variables
# PYTHONUNBUFFERED keeps Python from buffering stdout and stderr (equivalent to python -u option)
#ENV PYTHONUNBUFFERED=1

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 5001

# Run app.py when the container launches
CMD ["python", "app.py"]
