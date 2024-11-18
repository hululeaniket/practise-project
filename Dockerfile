FROM centos:latest
MAINTAINER anikethulule2811@gmail.com

# Install dependencies
RUN yum install -y httpd zip unzip curl

# Download the file with retries
RUN curl -L -o /var/www/html/photogenic.zip --retry 5 --retry-delay 5 \
    https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip

WORKDIR /var/www/html/

# Unzip the file and clean up
RUN unzip photogenic.zip && rm -rf photogenic.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
