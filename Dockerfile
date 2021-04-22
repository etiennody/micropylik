# Pull a base image
FROM python:3.8-slim-buster

# Set environment variables
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1
ENV PYTHONUNBUFFERED 1

# Create a working directory for the django project
WORKDIR /micropylik

# Copy requirements to the container
COPY Pipfile Pipfile.lock /micropylik/

# Install compilation dependencies
RUN apt-get update && apt-get install -y python3-dev default-libmysqlclient-dev build-essential

# Install the requirements to the container
RUN pip install pipenv && pipenv install --system

# Copy the project files into the working directory
COPY . /micropylik/

# Open a port on the container
EXPOSE 8000