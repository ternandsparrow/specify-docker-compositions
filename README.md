# Docker Compositions

This repository is intended to house a collection of docker-compose
recipes in different directories for deploying Specify 7 in various
scenarios. The idea is that you can choose a scenario, enter the
corresponding directory, make the necessary adjustments and then run
`docker-compose up -d` to obtain a working setup.

There are currently three setups defined here:

1) [Just Specify 7](just-specify7/README.md) includes only the elements needed
to run Specify 7 in an environment with an existing Specify 6 MySQL
database server in place.

2) [All in One](all-in-one/README.md) includes a database server and
an asset server, producing a usable setup starting only with a SQL
backup file from a Specify 6.8.01 system.

3) [Multiple Databases](multiple-databases/README.md) extends the
*Just Specify 7* example to illustrate using name based virtual hosting
of two Specify databases. The example can be extended to an arbitrary
number of databases.

Alternative options:
- [Development Docker Composition](https://github.com/specify/specify7/wiki/Docker-Workflow-for-Development)
  if you would like to add new features to Specify 7 or do debugging.
- [Specify 7 Test Panel](https://github.com/specify/specify7-test-panel)
  for deploying several versions of Specify 7 using a user interface.
- [Specify Cloud Composition](https://github.com/specify/docker-compositions/tree/production/specifycloud),
  which is used by our Specify Cloud servers and show
  an example of generating a `docker-compose.yml` from a JSON spec.

## Changes for [Schema 2.10](https://discourse.specifysoftware.org/t/specify-6-8-02-and-schema-2-10-updates-release-notes/830)

If you are upgrading from a previous
version you will need to make the following adjustments:

1. Once you have updated the database using Specify 6.8.02, you
   will have to update the `image:` attribute in the Specify 6 section of your
   `docker-compose.yml` file to select the new version of Specify 6 (`6.8.02`) as
   well. You will also need to connect to the database with a copy of
   the new version of Specify 6 to update the database to that
   version, or import an updated back up of the database into the
   MySQL/Mariadb server.

## Changes for Specify 7.7

The recipes provided in this repository have been updated for the
latest release of Specify 7. If you are upgrading from a previous
version you will need to make the following adjustments:

1. Update the `image:` attribute in the Specify 7 sections of your
   `docker-compose.yml` file to select the new version of Specify 7.

## Changes for Specify 7.6

The recipes provided in this repository have been updated for the
latest release of Specify 7. If you are upgrading from a previous
version you will need to make the following adjustments:

1. Update the `image:` attribute in the Specify 7 sections of your
   `docker-compose.yml` file to select the new version of Specify 7.

2. If you are updating the version of Specify 6 at the same time you
   will have to update the `image:` attribute in the Specify 6 section of your
   `docker-compose.yml` file to select the new version of Specify 6 as
   well. You will also need to connect to the database with a copy of
   the new version of Specify 6 to update the database to that
   version, or import an updated back up of the database into the
   MySQL/Mariadb server.

3. Specify 7.6 requires a new *worker* service for executing workbench
   validation and upload jobs. You will need to add the worker service
   and a *redis* service to your existing `docker-compose.yml`. See
   the example recipes for the details.
