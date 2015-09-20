# Apiapp

## Docker + docker-compose + Rails 4-based API + base auth + rolify + nginx

This is an example of production-ready Rails-based API application, `unicorn` is
proxied by `nginx`, database is `Postgres`, with Docker and docker-compose enabled.
This way, to rollout it locally you just need to:

### Mac OS X
Install Docker Toolbox, and:

```
cd /app/path
docker-compose build
docker-compose up
boot2docker ip # => 192.168.99.100 for example

# the app will be available at http://192.168.99.100
```

### Linux
If you need Docker stack up and running. Guides are available at
https://docs.docker.com/installation/, or you can use distro-shipped package.

Then, the same:

```
cd /app/path
docker-compose build
docker-compose up

# the app should be available at http://localhost
```
