1. Run `composer require/install` to prepare your dependencies as needed
2. Place your module or theme files where they would go into the file tree,
   inside the recently created `./html/`
3. Run in a separate terminal `docker-compose up --build`
4. Use `docker ps` to get container ID
5. User `docker exec -u www-data -ti container-id bash` to get into the testing
   environment
6. Run `vendor/bin/phpunit` with paramenters:
   ```
   vendor/bin/phpunit --verbose  html/modules/dpc-user-management/tests/src/Functional/UserSpecialGroupsTest.php
   ```
