# Multiple Databases

It is possible to host Specify 7 instances for multiple database off
of a single host by using name based virtual hosting. This example is
based off of the [Just Specify 7](../just-specify7/README.md) example,
so an understanding of that configuration is assumed.

Hosting of multiple databases is accomplished by configuring multiple
Specify 7 service containers within the *docker-compose* file. The
*nginx* config file is then configured with multiple *server* stanzas
with different `server_name` directives each proxying to the
corresponding Specify 7 service container. Because each Specify 7
service manages its own set of static files, Docker volumes are
declared for each and all shared with the Nginx container.

The example `docker-compose.yml` and `nginx/specify.conf` provided in
this directory illustrate configuring two Specify 7 instances. Each
Specify 7 instance is configured independently as described in
[Just Specify 7](../just-specify7/README.md). The Nginx configuration
requires only adjusting the `server_name` directives.

This example can be extended to an arbitrary number of databases by
adding more Specify 7 service containers and corresponding Nginx
server stanzas and static file volumes. Notice in the example that the
correspondences between these are effected by appending `-db1` and
`-db2` to the resources where they appear in `docker-compose.yml`
and `nginx/specify.conf`. This correspondence would naturally be
extended in the case of additional databases.
