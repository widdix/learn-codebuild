FROM amazonlinux:2
RUN yum install -y httpd
ADD html/ /var/www/html
EXPOSE 80
CMD "httpd" "-DFOREGROUND"
