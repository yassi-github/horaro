#!/usr/bin/env sh

set -e

# generate Doctrine proxies
php vendor/doctrine/orm/bin/doctrine orm:generate-proxies

# start php-fpm
exec docker-php-entrypoint php-fpm
