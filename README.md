# docker-enju-leaf

Docker-related files for [Enju Leaf](https://github.com/next-l/enju_leaf).

## Launch Enju Leaf with Docker Compose

```
$ wget https://github.com/orangain/docker-enju-leaf/raw/master/docker-compose.yml
$ docker-compose up
```

## Launch Enju Leaf with Standalone Docker Engine

```
$ docker run -it -p 3000:3000 -e DB_HOST=<POSTGRES_HOST> orangain/enju_leaf:1.2.0
```

## Settings via Enviroment Variables

* `DB_HOST`: Hostname or IP address of PostgreSQL. Default is `db`.
* `DB_USERNAME`: Username of PostgreSQL. Default is `postgres`.
* `DB_PASSWORD`: Password of PostgreSQL. Default is `password`.
* `DB_DATABASE`: Database name of PostgreSQL. Default is `enju_production`.
* `SECRET_KEY_BASE`: Secret key for Rails. Automatically generated on startup by default. This means that sessions will be invalidated when you upgrade or re-create a container. To avoid the invalidation, specify `SECRET_KEY_BASE` explicitly.
