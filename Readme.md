# Introduction
This Project built with nginx and docker will help you run a local API-Gateway for your backend services in a local or a development environment.

# Project Structure
Project structure
```
.
├── Dockerfile
├── Readme.md
├── api_backends.conf
├── api_conf.d
│   ├── service_1.conf
│   ├── service_2.conf
├── api_json_errors.conf
├── cors.conf
├── http-proxy.conf
├── nginx.conf
└── proxy.conf
```

Here is a breif overview of each file purpose:


File                  | Usage
----------------------|------
Dockerfile            | Docker container build Intructions 
nginx.conf            | Nginx base config and schema definition
http-proxy.conf       | Nginx Server block definition and properties
proxy.conf            | Reverse proxy configurations (forward headers and set timeouts)
api_json_errors.conf  | Custome and friendly definitions for 4xx/5xx errors
cors.conf             | Cross Origin Resource access header (handles preflight) 
api_backends.conf     | Backend services definitions (host:port mapping)
api_conf.d/           | handle Routing and integration for backend services

---------------------
# Building and Running the Gateway
Pre-requisits: 

1. Make sure your docker daemon is up and running

## Building the container
To build the gateway container from Dockerfile, use the command below:
```bash
 $ docker build . -t ngx-gateway 
```

## Running the Container 
Use the command below to run the container after building
```bash
$ docker run -d --rm -p 80:80 --name ngx-gateway ngx-gateway
```

 Option       | Usage
--------------|--------
 -d           | detach from container (remove for debugging)
 --rm         | remove the container if stopped
 -p           | Publish port (container port:host port)
 --name       | container name
 ngx-gateway  | the image to luanch container from

## Logging
Logging is enabled on the container to enable debugging and troubleshooting. To see the logs of your currently running container use the command below
```bash
$ docker logs -f ngx-gateway
```