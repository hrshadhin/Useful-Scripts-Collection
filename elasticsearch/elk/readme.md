# ELK - ElasticSearch, Logstash, Kibana
- Indexing huge data to elastic from CSV using ElasticSearch and Logstash
- Monitoring apache/nginx/application logs using elastic stacks(ElasticSearch, Logstash, Kibana, File Beats).

## Docker compose files
Top directory `*.yml`

## Logstash and file beats configs
In `conf.d` directory

## Data 
pull your csv, or logs file inside `data` directory

## Run
#### Monitor apache logs
- First start elasticsearch and kibana `docker-compose -f elastic_kibana.yml`
- Start logstash `docker-compose -f logstash.yml`
- now start file beats to collect logs and continous shipping to logstash `docker-compose -f filebeat.yml`

#### Import CSV data to elastic search via logstash
- First start elasticsearch and kibana `docker-compose -f elastic_kibana.yml`
- Now start logstash
    - Change config for csv in compose yaml file and run `docker-compose -f logstash.yml`
    - Or run a docker container directly. i.e
        `docker run --rm -it --name logstash --network elk_loging -v "$PWD/data":/data -v ./conf.d/logstash-cars.conf:/usr/share/logstash/pipeline/logstash.conf logstash:6.8.10`

## Usage/Visualize
- use kibana to query your data, visulize or mointior dashboard
- kibana access `http://localhost:5601`
- dashboard for apache log monitoring
    ![dashboard.png](dashboard.png)