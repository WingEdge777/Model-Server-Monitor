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
cp -r dashboards/* /var/lib/grafana/dashboards/
bash start.sh

echo "fire up! visit the dashboard at http://localhost:3131"

