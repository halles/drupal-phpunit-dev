FROM geerlingguy/drupal:latest

ENTRYPOINT ["docker-entrypoint.sh"]

RUN rm -rf /var/www/html && \
    mkdir /var/www/html && \
    chmod 755 /var/www/html

COPY ./vendor/ /var/www/vendor
RUN chown -R www-data:www-data /var/www/vendor

COPY ./html/ /var/www/html
COPY local.settings.php /var/www/html/sites/default/

RUN chown -R www-data:www-data /var/www/html

COPY phpunit.xml /var/www/phpunit.xml
RUN chown www-data:www-data /var/www/phpunit.xml

RUN mkdir /var/www/html/browser_output && \
    chmod 777 /var/www/html/browser_output && \
    chown -R www-data:www-data /var/www/html/browser_output && \
    mkdir /var/www/html/sites/simpletest && \
    chmod 777 /var/www/html/sites/simpletest && \
    chown -R www-data:www-data /var/www/html/sites/simpletest

WORKDIR "/var/www"

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]