# Use an official Nginx image as the base image
FROM nginx:latest

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom Nginx configuration file to the container
COPY nginx/nginx.conf /etc/nginx/conf.d/

# Copy the static files from your Django project to the Nginx root directory
COPY /usr/src/app/static_root /usr/src/app/static_root

# Expose port 80 for incoming HTTP requests
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
