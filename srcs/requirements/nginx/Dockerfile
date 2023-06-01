# Pull the Debian Buster image
FROM debian:buster

# Expose the port for access
EXPOSE 443

# Install Nginx
RUN apt-get -y update
RUN apt-get -y install nginx

# Install OPENSSL
RUN apt-get install openssl

# Generates a self-signed certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/nginx/cert.pem -keyout /etc/nginx/key.pem -subj "/C=FR/ST=Charente/L=Angouleme/O=42/CN=retcheba.42.fr";

# Copy Nginx configuration file
RUN rm /etc/nginx/nginx.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Removes files after package installation to reduce the size of the container image
RUN rm -rf /var/lib/apt/lists/*

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
