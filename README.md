1. Run `composer require/install` to prepare your dependencies as needed
2. Run in a separate terminal `docker-compose up --build`
3. Use `docker ps` to get container ID
4. User `docker exec -u www-data -ti container-id bash` to get into the testing environment
5. Run `vendor/bin/phpunit` with paramenters:
   ```
   vendor/bin/phpunit --verbose  html/modules/dpc-user-management/tests/src/Functional/UserSpecialGroupsTest.php
   ```