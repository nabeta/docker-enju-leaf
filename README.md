# docker-enju-leaf

Docker image for [Next-L Enju Leaf](https://github.com/next-l/enju_leaf). Next-L Enju Leaf is an integrated library system developed by [Project Next-L](http://www.next-l.jp/).

## Launch Enju Leaf with Docker Compose (Recommended)

1. Install [Docker Engine](https://docs.docker.com/engine/) and [Docker Compose](https://docs.docker.com/compose/).

2. Download `docker-compose.yml` and launch containers.

   ```
   $ wget https://github.com/orangain/docker-enju-leaf/raw/master/docker-compose.yml
   $ docker-compose up
   ```

3. Open `http://<DOCKER_HOST>:3000/` in a browser. Default administrator account is:
   * user: `enjuadmin`
   * password: `adminpassword`

## Administration

Database migration and reindexing in Solr is automatically done when a container is created. If database is empty, i.e. there's no table, initial data will be also inserted automatically.

If needed, you can run administration tasks manually using `docker-compose exec` as followings:

Reindex in Solr:

```
$ docker-compose exec web rake sunspot:reindex
```

Run SQL using psql:

```
$ docker-compose exec db psql -U postgres enju_production
```

## Launch Enju Leaf with Standalone Docker Engine

1. Install [Docker Engine](https://docs.docker.com/engine/) and setup PostgreSQL.

2. Launch a container.

   ```
   $ docker run -it -p 3000:3000 -e DB_HOST=<POSTGRES_HOST> orangain/enju_leaf:1.2.0
   ```

3. Open `http://<DOCKER_HOST>:3000/` in a browser. Default administrator account is:
   * user: `enjuadmin`
   * password: `adminpassword`

## Settings via Enviroment Variables

* `DB_HOST`: Hostname or IP address of PostgreSQL. Default is `db`.
* `DB_USERNAME`: Username of PostgreSQL. Default is `postgres`.
* `DB_PASSWORD`: Password of PostgreSQL. Default is `password`.
* `DB_DATABASE`: Database name of PostgreSQL. Default is `enju_production`.
* `SECRET_KEY_BASE`: Secret key for Rails. Automatically generated on startup by default. This means that sessions will be invalidated when you upgrade or re-create a container. To avoid the invalidation, specify `SECRET_KEY_BASE` explicitly.
