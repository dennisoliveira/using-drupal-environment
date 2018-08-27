FROM ubuntu:12.04

# Update repositories
RUN apt-get update && apt-get upgrade

# Install Helpers
RUN apt-get install vim -y

# Install Apache
RUN apt-get install apache2 -y
RUN a2enmod rewrite

# Install PHP 5.3
RUN apt-get install -y php5 \
  php5-common \
  php5-cli \
  php5-dev \
  php5-mysql \
  php5-pgsql \
  php5-gd \
  php5-mcrypt \
  php5-curl \
  php-pear \
  libapache2-mod-php5 \
  php5-xdebug


# ENTRYPOINT ["/bin/bash"]
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]