#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Sorry Frantz, I'm waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL has started"
fi

python manage.py flush --no-input
python manage.py migrate
#you can run manually by doing
# docker exec web python manage.py flush --no-input
# docker exec web manage.py migrate

exec "$@"