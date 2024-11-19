FROM almalinux:8
MAINTAINER anikethulule2811@gmail.com

# Install dependencies
RUN yum install -y httpd zip unzip && yum clean all

# Copy pre-downloaded file
COPY photogenic.zip /var/www/html/

WORKDIR /var/www/html/

# Unzip the file and clean up
RUN unzip photogenic.zip && rm -rf photogenic.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
