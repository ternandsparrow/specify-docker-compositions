{% for server in servers %}
docker-compose up -d {{ server }} {{ server }}-worker
sleep 30
{% endfor %}
