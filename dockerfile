# start from the tiny Apache HTTPD Alpine image
FROM httpd:alpine

# copy your static site into the default doc root
COPY . /usr/local/apache2/htdocs/

# (the base image EXPOSEs port 80 for you)
