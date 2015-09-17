# Web Server Image for our production container: #

- Apache with Mod_rewrite enable
- PHP 5.5 with PDO, MySQL, Redis, Memcache Extension
- Supervisord to monitor apache process to prevent failure
- Collectd with write_http plugin to send heartbeat to a website endpoint

# Configuration #
- Apache configuration in /apache-config.conf
- Supervisord configuration in /supervisord.conf
- CollectD configuration in /collectd-config.conf.tpl

# Environment Variables #
- APACHE_RUN_USER
- APACHE_RUN_GROUP
- APACHE_LOG_DIR

- COLLECTD_WRITEHTTP_HOST : URL will receive data (HTTP POST request) from collectd agent. For testing, you can create a temporary URL at http://requestb.in/

# Binding code directory for development #
- If you want to mount your developing source code directory to running container (to prevent re-build each time when code change), you can mount volumn from your source code directory to "/var/www/site/".
`
    docker run ... -v /path/to/source/code:/var/www/site/
`

- Note on MacOS: becausing using virtualbox, so, running virtualbox image share folder /Users with host. So, if you want to mount volumn to docker container, you must put your folders/files in your /Users or sub directories of /Users on your Macbook Disk.

# Example Run #
- Normal start web server:
    `
    $ > docker run -ti -d -p 8080:80 -h webserver -e COLLECTD_WRITEHTTP_HOST="http://receive-collectd-server/" --name web01 voduytuan/docker-apache-php 
    `

# Docker Hub Repository #
- You can pull from my image at: https://hub.docker.com/r/voduytuan/docker-apache-php/
    `
    $ > docker pull voduytuan/docker-apache-php
    `
