#!/bin/bash

# We need to install dependencies only for Docker
[[ ! -e /.dockerenv ]] && exit 0

set -xe

# Install composer dependencies
wget https://composer.github.io/installer.sig -O - -q | tr -d '\n' > installer.sig
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === file_get_contents('installer.sig')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php'); unlink('installer.sig');"

php composer.phar config -g github-oauth.github.com 4a65ee71ad50500a11fd4043e919f084a1841bee