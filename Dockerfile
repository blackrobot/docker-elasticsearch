# Pull base image.
FROM java:7

ENV ES_VERSION 1.3.2

# Install ElasticSearch.
RUN curl -SL "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz" \
    | tar zx \
    && mv -f /elasticsearch-$ES_VERSION /elasticsearch

# Default cluster name
# ENV CLUSTER_NAME elasticsearch
# ENV DATA_PATH /data/data
# ENV LOGS_PATH /data/logs

# 9200: HTTP
# 9300: transport
EXPOSE 9200 9300

# Define mountable directories.
VOLUME ["/data"]

WORKDIR /data

CMD /elasticsearch/bin/elasticsearch
