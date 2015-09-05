# Beanstalkd Docker Container

By default this container writes to the `/wal` volume and fsyncs on every write.

## Usage

```
# Build the container
$ make

# Run the container
$ make run

# Get Docker ps info on the running container
$ make ps

# Stop/kill the running container
$ make kill

# Remove the container (not the image)
$ make rm

# Get the address and port of the running beanstalkd.
# NOTE: this assumes you are using the default docker-machine profile
$ make port

```

## Extras

The container includes the [beanstool](https://github.com/tyba/beanstool) command line client for admin and
debugging.

**exampe**
```
docker exec -ti beanstalkd /usr/local/bin/beanstool stats
+---------+----------+----------+----------+----------+----------+----------+----------+
| Name    | Buried   | Delayed  | Ready    | Reserved | Urgent   | Waiting  | Total    |
+---------+----------+----------+----------+----------+----------+----------+----------+
| default | 0        | 0        | 0        | 0        | 0        | 0        | 0        |
+---------+----------+----------+----------+----------+----------+----------+----------+
```
