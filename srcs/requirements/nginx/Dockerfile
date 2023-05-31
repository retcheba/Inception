# Pull the Debian Buster image
FROM debian:buster

# Install Nginx
RUN apt-get -y update
RUN apt-get -y install nginx

# Copy the cert.pem and the key.pem files
COPY tools/cert.pem /etc/nginx/cert.pem
COPY tools/key.pem /etc/nginx/key.pem

# Copy the Nginx config
RUN rm /etc/nginx/nginx.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose the port for access
EXPOSE 443

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
