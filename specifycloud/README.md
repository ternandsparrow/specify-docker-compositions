# Specify Cloud
This is the configuration used by Specify Consortium for hosted databases and simplifies 
configuring many Specify 7 servers within a single Docker host. Rather than configuring 
`docker-compose.yml` and `nginx.conf` directly, the files are generated from templates using 
a control file, `spcloudservers.json`, that specifies the servers to be instantiated.

The workflow is to create/edit `spcloudservers.json` and `defaults.env`. Then run `make` and
`docker-compose up -d`.

## Requirements
1. gnumake
2. j2cli https://github.com/kolypto/j2cli

## Makefile
Contains targets to generate `docker-compose.yml` and `nginx.conf`. 

## spcloudservers.json
This file definies all of the servers to be instantiated. Here is an example with comments:
```
{
    "servers": {
        "sp7demofish": {                 # The server name will be sp7demofish.
            "database": "sp7demofish",   # Use this database. If not specified use the servername with dashes replaced with underscores.
            "env": {
                                         # Docker environment variable overrides can be placed here.
                "ASSET_SERVER_URL": 
                  "https://demo-assets.specifycloud.org/web_asset_store.xml"
            },
            "sp7": "edge",               # The specify7-service image tag to be used. From https://hub.docker.com/r/specifyconsortium/specify7-service/tags.
            "sp6": "specify6800",        # The version of Specify 6 matching the database version. Must correspond to a key in the "sp6versions" section below.
            "https": true                # Whether to configure nginx for https for this service. Optional; defaults to true.
        },

        "ichthyology": {                 # Another server.
            "sp7": "issue-1005",
            "sp6": "specify6801",
            "env": {
                "ANONYMOUS_USER": "GuestUser"
            }
        },
        
    "sp6versions": {
                                       # These are the Specify 6 versions that will be used.
                                       # The keys are arbitrary names that can be referenced from the servers section.
                                       # The values indicate the specify6-service image tag from https://hub.docker.com/r/specifyconsortium/specify6-service/tags. 
        "specify6800": "6.8.00",
        "specify6801": "6.8.01"
    }
}

```

## defaults.env
All of the common environment settings for the Specify 7 servers and workers are defined here.
May be overidden by values in the `env` section of the `spcloudservers.json` file.

```
DATABASE_HOST=10.132.219.186
DATABASE_PORT=3306
MASTER_NAME=Master
MASTER_PASSWORD=*********
SECRET_KEY=********
ASSET_SERVER_URL=https://assets1.specifycloud.org/web_asset_store.xml
ASSET_SERVER_KEY=********
REPORT_RUNNER_HOST=10.132.219.183
REPORT_RUNNER_PORT=8080
CELERY_BROKER_URL=redis://redis/0
CELERY_RESULT_BACKEND=redis://redis/1
LOG_LEVEL=WARNING
SP7_DEBUG=false
```
