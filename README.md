# Docker-Thelia

## Intro 

Run Thelia 2.X LEMP stack (Linux Nginx MySQL PHP-FPM) powered by Docker.

## Pre-requisites

Have a Docker environment ok.

To install Docker on your computer, please follow instructions [here](https://docs.docker.com/installation/) choosing your platform.

## Description

-> Dockerfile 			// to build container  
-> conf/nginx/sites-enabled/ 	// vhost definition  
-> conf/php5-fpm/ 		// php5 configuration  
-> src/ 			// where sources of thelia must be   

## Build the container from GitHub repository

Clone this repository : 

```
git clone https://github.com/driou/docker-thelia
```

From root of the repository, build the image container :

```
docker build -t docker-thelia . 
```

## Use 

### Get Thelia sources

```
cd src/
git clone https://github.com/thelia/thelia
cd thelia/
git checkout 2.X.Y # X and Y concern the version you want
curl -sS https://getcomposer.org/installer | php
php composer.phar install
```


###

Verify that port 80 is not used (check local WebServer apache2/nginx/...)

From root of the repository, run the container like this: 

Daemon mode :

```
docker run -d -p 80:80 -v $PWD/conf/php5-fpm:/etc/php5/fpm/ -v $PWD/conf/nginx/sites-enabled:/etc/nginx/sites-enabled -v $PWD/src:/usr/share/nginx/html/ docker-thelia  
```

- direct bash with nsenter(https://github.com/jpetazzo/nsenter)


So TODO
- Fix user / groups rights (now 777 on src/ directory is needed)
- tune mysql
- add tools (phpmyadmin, mailcatcher)
