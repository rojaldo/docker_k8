FROM nginx:alpine

# Remove the default index.html (optional)
RUN rm /usr/share/nginx/html/index.html

# Copy your sample.html as the new index.html
COPY sample.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground (default CMD)
CMD ["nginx", "-g", "daemon off;"]