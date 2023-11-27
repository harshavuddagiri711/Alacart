# Use an official Python image as the base
FROM python:3.11

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-wsgi-py3 \
    mongodb-clients

# Create and set the working directory
WORKDIR /app

# Copy your Django project files into the container
COPY . /app/

# Install Python dependencies using pip
RUN pip3 install -r requirements.txt

# Configure Apache for Django with mod_wsgi
COPY apache/django.conf /etc/apache2/sites-available/django.conf
RUN a2ensite django

# Expose the port for Apache
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

