# Base image - Python 3.9 slim to keep image size small
FROM python:3.9-slim

# Set the working folder to /app inside the container
WORKDIR /app

#Copy all the local files to /app inside the container 
COPY . /app

#install dependecies from requirements.txt 
RUN pip install -r requirements.txt

#start the flask app when the container runs 
CMD [ "python", "app.py" ]

#Open port 5000 which is Flask defult port so that app is accessible
EXPOSE 5000