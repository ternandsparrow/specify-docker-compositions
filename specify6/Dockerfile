FROM openjdk:11-jre-buster
ARG version

WORKDIR /tmp
RUN wget https://update.specifysoftware.org/${version}/Specify_unix_64.sh

RUN mkdir -p /opt
RUN sh Specify_unix_64.sh -q -dir /opt/Specify

FROM instrumentisto/rsync-ssh

COPY --from=0 /opt/Specify /opt/Specify
RUN mkdir -p /volumes

CMD rsync -a --delete /opt/Specify/ /volumes/Specify \
 && echo "Successfully updated Specify 6 files\n" \
 && echo "This container is only needed during start up to give Specify 7 information about the data model\n" \
 && echo "It will now exit"
