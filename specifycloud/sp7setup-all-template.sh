{% for server in servers %}
docker-compose run --rm {{ server }}-worker sp7setup
{% endfor %}
