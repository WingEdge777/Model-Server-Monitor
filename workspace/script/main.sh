#!/bin/bash
# init mysql for grafana
service mysql start

mysql -e "CREATE DATABASE grafana; \
        CREATE USER 'user'@'localhost' IDENTIFIED BY '12345678'; \
        GRANT ALL PRIVILEGES ON grafana.* TO 'user'@'localhost'; \
        FLUSH PRIVILEGES;"


# init VictoriaMetrics
cd VM
bash start.sh
cd ..

# run telegraf
cd telegraf
bash start.sh
cd ..


# run grafana
cd grafana 
bash start.sh
cd ..

