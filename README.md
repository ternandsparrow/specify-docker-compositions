# docker-compositions

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
backup file from a Specify 6.8.00 system.

3) [Multiple Databases](multiple-databases/README.md) extends the
*Just Specify 7* example to illustrate using name based virtual hosting
of two Specify databases. The example can be extended to an arbitrary
number of databases.
