# Pull base image.
FROM java:7

ENV ELASTICSEARCH_VERSION 1.3.2

# Install ElasticSearch.
RUN curl -SL "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz" \
    | tar zx \
    && mv -f /elasticsearch-$ELASTICSEARCH_VERSION /elasticsearch

# Add the setup file
COPY setup /scripts/setup
RUN chmod +x /scripts/setup

# Default cluster name
ENV CLUSTER_NAME elasticsearch
ENV DATA_PATH /data/data
ENV LOGS_PATH /data/logs

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD /scripts/setup && /elasticsearch/bin/elasticsearch
