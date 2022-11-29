# All in One

The setup in the *all-in-one* directory provides a complete Specify
system including Specify 7, database, asset server, report runner and
webserver on a single host. Since all services are included it
requires minimal configuration. First, a seed database must be
provided in the form of a Specify SQL backup file. It should not
include any `CREATE DATABASE ...;` or `USE ...;` statements and should
be placed in the *seed-database* directory. It will be automatically
restored into the database server. Next, a few variables must be
configured in the *docker-compose.yml* file:

## Under "specify7:"

### SECRET_KEY

This should be set to some random string.

See https://docs.djangoproject.com/en/2.2/ref/settings/#secret-key

### ASSET_SERVER_KEY

This should also be set to some random string, but must match the
value in `ATTACHMENT_KEY` under `asset-server:`.

## Under "asset-server:"

### SERVER_NAME

Set this to the DNS name or IP address of the host running Docker
Compose. It should match the name that will be used to navigate to the
system.

### ATTACHMENT_KEY

This should be set to a random string. It must match the value in
`ASSET_SERVER_KEY` under `specify7:`.

## Optional Config:

For troubleshooting the logging and debug settings under `specify7`
may be useful:

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
by executing commands from within the *all-in-one* directory.

Run `docker-compose up -d` to bring up Specify 7. Stop by running
`docker-compose stop`.

If you want the services to start when the host
system boots, add `restart: unless-stopped` to all of the services in
`docker-compose.yml`.

Refer to the documentation for [Docker](https://docs.docker.com) for more.
