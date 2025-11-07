# Use a lightweight Nginx image as the base
FROM nginx:alpine

# Copy all project files to Nginx's default html directory
COPY . /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
