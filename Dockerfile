FROM centos:latest

# Install necessary packages
RUN yum install -y httpd zip unzip

# Add the zip file to the specified location
ADD https://www.free-css.com/free-css-templates/page295/antique-cafe /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Unzip the contents of the zip file
RUN unzip photogenic.zip

# Corrected the folder name "photogeneic" to "photogenic"
RUN cp -rvf photogenic/* . 

# Clean up the unnecessary files
RUN rm -rf photogenic photogenic.zip

# Command to run the HTTP server in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80