build:
	docker build -t jefhar/singing-valentines .

docker:
	docker-compose up -d --build

down:
	docker-compose down

stop:
	docker-compose stop

start:
	docker-compose start

clean:
	docker system prune

composerinstall:
	docker run --rm -v "$(CURDIR):/app:delegated" jefhar/singing-valentines sh -c 'cd /app && composer install'

composerupdate:
	docker run --rm -v "$(CURDIR):/app:delegated" jefhar/singing-valentines sh -c 'cd /app && composer update'

checkcomposer:
	docker run --rm -v "$(CURDIR):/app:delegated" jefhar/singing-valentines sh -c 'cd /app && vendor/bin/security-checker security:check composer.lock'

ci:
	gitlab-runner exec docker test

cidusk:
	gitlab-runner exec docker dusktest

yarninstall:
	docker run --rm -v "$(CURDIR):/app:delegated" jefhar/singing-valentines:yarn sh -c 'cd /app && yarn install'

yarnaudit:
	docker run --rm -v "$(CURDIR):/app:delegated" jefhar/singing-valentines:yarn sh -c 'cd /app && yarn audit'

yarnupgrade:
	docker run --rm -v "$(CURDIR):/app:delegated" jefhar/singing-valentines:yarn sh -c 'cd /app && yarn upgrade'

npmdev:
	docker run --rm -v "$(CURDIR):/app:delegated" jefhar/singing-valentines:yarn sh -c 'cd /app && npm run development'

npmprod:
	docker run --rm -v "$(CURDIR):/app:delegated" jefhar/singing-valentines:yarn sh -c 'cd /app && npm run production'

npmwatch:
	docker run --rm -v $(CURDIR):/app:delegated jefhar/singing-valentines:yarn sh -c 'cd /app && npm run development -- --watch'

swagger:
	docker run --rm -p 8088:8080 swaggerapi/swagger-editor

phpcs:
	docker run --rm -v "$(CURDIR):/app:delegated" jefhar/singing-valentines sh -c 'cd /app && composer phpcs'

phpcbf:
	docker run --rm -v "$(CURDIR):/app:delegated" jefhar/singing-valentines sh -c 'cd /app && composer phpcbf'

pretest:
	rm -rf tests/coverage*
	docker run --rm -v"$(CURDIR):/app:delegated" jefhar/singing-valentines sh -c 'cd /app && composer pretest'

test:
	docker run --rm -v"$(CURDIR):/app:delegated" jefhar/singing-valentines:pcov sh -c 'cd /app && composer test'

deploy:
	docker network create web || echo "Docker network web already created."
	docker-compose up -d php-fpm redis mysql webserver

refresh:
	php artisan db:wipe && php artisan migrate && php artisan db:seed --class UsersTableSeeder && php artisan db:seed --class DummyDataSeeder

install: build deploy composerinstall yarninstall
