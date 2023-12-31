# Just Specify 7

This setup would be suitable if you have an existing networked Specify
6.8.00 installation with a central MySQL or MariaDB server and a central
Specify asset server. Specify 7 needs at least three
services. [Specify
7](https://hub.docker.com/repository/docker/specifyconsortium/specify7-service)
itself. [Specify
6](https://hub.docker.com/repository/docker/specifyconsortium/specify6-service)
which in this case is not so much a service as it is a set of resource
files. And a [webserver](https://hub.docker.com/_/nginx) to proxy
requests and serve static files. A fourth service, the [report
runner](https://hub.docker.com/repository/docker/specifyconsortium/report-runner),
is required for generating reports and labels. The Docker composition
in the *just-specify* directory provides these four services. If you
don't plan on using reports or labels, the report-runner service can
be commented out of the *docker-compose.yml* file.

## Configuration

The *docker-compose.yml* file contains several environment variables
for Specify 7 that will need to be configured.

### DATABASE_HOST

This variable must be set to the DNS name or IP address of the MySQL
or MariaDB server.

### DATABASE_PORT

Change this variable if your MySQL or MariaDB server is listening on a
port other than the default 3306.

### DATABASE_NAME

This is the name of the Specify MySQL database. 

### MASTER_NAME and MASTER_PASSWORD

The MySQL login credentials. This needn't be the same as the Specify 6
master user but will need full permissions to the Specify database.

### SECRET_KEY

This should be set to some random string.

See https://docs.djangoproject.com/en/2.2/ref/settings/#secret-key

### ASSET_SERVER_URL and ASSET_SERVER_KEY

These should be set to the same values as in your Specify 6
configuration for using the Specify asset server. If you are not using
attachments, these variables can be commented out.

### LOG_LEVEL

This variable controls the Specify 7 logging level. Possible values
are:

* DEBUG: Low level system information for debugging purposes.
* INFO: General system information.
* WARNING: Information describing a minor problem that has occurred.
* ERROR: Information describing a major problem that has occurred.
* CRITICAL: Information describing a critical problem that has occurred.

### SP7_DEBUG

Set this variable to `true` to run Specify 7 in debug mode. This
should only be used during troubleshooting and not during general
use. Django applications leak memory when operated continuously in
debug mode.

## Running

Starting and stopping the Specify 7 via Docker Compose is accomplished
by executing commands from within the *just-specify7* directory.

Run `docker-compose up -d` to bring up Specify 7. Stop by running
`docker-compose stop`.

If you want the services to start when the host
system boots, add `restart: unless-stopped` to all of the services in
`docker-compose.yml`.

Refer to the documentation for [Docker](https://docs.docker.com) for
more information.
