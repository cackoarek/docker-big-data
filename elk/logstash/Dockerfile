# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash:7.5.0

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
RUN logstash-plugin install logstash-filter-prune
RUN logstash-plugin install logstash-input-kafka