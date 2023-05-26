# Pull the Debian Buster image
FROM debian:buster

# Install Nginx
RUN apt-get -y update && apt-get -y install nginx

# Copy the Nginx config
COPY conf/default /etc/nginx/sites-available/default

# Expose the port for access
EXPOSE 80/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
