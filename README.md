# Web Server Image for our production container: #

- Apache with Mod_rewrite enable
- PHP 5.5 with PDO, MySQL, Redis, Memcache Extension
- Supervisord to monitor apache process to prevent failure
- Collectd with write_http plugin to send heartbeat to a website endpoint

# Environment Variables #
- APP_ROOTURL
- MYSQL_SERVER
- MYSQL_DATABASE
- MYSQL_USERNAME
- MYSQL_PASSWORD

- APACHE_RUN_USER
- APACHE_RUN_GROUP
- APACHE_LOG_DIR

- COLLECTD_WRITEHTTP_HOST

# Binding code directory for development #
- If you want to mount your developing source code directory to running container (to prevent re-build each time when code change), you can mount volumn from your source code directory to "/var/www/site/".
`
    docker run ... -v /path/to/source/code:/var/www/site/
`

# Example Run #
- Normal start web server:
    `
    $ > docker run -ti -d -p 8080:80 -h webserver -e COLLECTD_WRITEHTTP_HOST="http://receive-collectd-server/" --name web01 voduytuan/docker-apache-php 
    `
