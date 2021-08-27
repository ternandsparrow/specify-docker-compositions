TARGETS= docker-compose.yml nginx.conf sp7setup-all.sh

all: $(TARGETS)

docker-compose.yml: docker-compose-template.yml spcloudservers.json
nginx.conf: nginx-template.conf spcloudservers.json
sp7setup-all.sh: sp7setup-all-template.sh spcloudservers.json

$(TARGETS):
	j2 -o $@ $^
