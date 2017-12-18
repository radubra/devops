FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
RUN apt-get update \
    && curl -kO https://packages.elastic.co/curator/5/debian9/pool/main/e/elasticsearch-curator/elasticsearch-curator_5.4.1_amd64.deb \
    && dpkg -i elasticsearch-curator_5.4.1_amd64.deb

COPY ./conf/delete_old_indices.xml /tmp/job.xml
