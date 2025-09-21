# Use official Nginx image
FROM nginx:alpine
# Copy custom static website files to nginx html folder
COPY . /usr/share/nginx/html
