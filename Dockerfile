# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the Python script files into the container
COPY modelGeneration.py /app/
COPY frontEnd.py /app/
COPY data_daily.csv /app/

# Install Flask and any other required dependencies
RUN python -m pip install --upgrade pip
RUN python -m pip install Flask
RUN python -m pip install numpy
RUN python -m pip install torch
RUN python -m pip install scikit-learn
RUN python -m pip install pandas

# Run the modelGeneration.py script
RUN python modelGeneration.py

# Expose the port that Flask will run on (default is 5000)
EXPOSE 5000

# Define the command to run your Flask application
CMD ["python", "frontEnd.py"]
