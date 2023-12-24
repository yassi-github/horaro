FROM php:7.4-alpine3.16

# install packages
RUN apk --no-cache add nodejs npm git

# install Composer
ADD https://getcomposer.org/download/1.9.0/composer.phar /usr/bin/composer
RUN chmod 555 /usr/bin/composer

# add our sources
COPY . /build
WORKDIR /build

# install PHP dependencies
RUN composer install --no-dev --no-suggest --no-progress --prefer-dist --ignore-platform-reqs

# build assets
RUN npm install grunt-cli && \
    npm install && \
    ./node_modules/.bin/grunt ship

# determine version
RUN git describe --tags --always > version

# remove temporary files to make the next copy commands easier
RUN rm -rf assets tmp/assets node_modules .git tests ; \
    find -name ".htaccess" -exec rm -f {} \; ; \
    find -maxdepth 1 -type f | grep -v ".*\.php" | grep -v "version" | grep -v "entrypoint.sh" | xargs -i{} rm -f {}

# set owner for fpm
RUN chown -R www-data:www-data .

# do nothing
ENTRYPOINT ["echo"]
