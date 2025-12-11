mkdir -p /etc/grafana/provisioning/datasources
cp ./datasources/vm.yaml /etc/grafana/provisioning/datasources/

export GF_DEFAULT_INSTANCE_NAME=my-instance
export GF_SECURITY_ADMIN_USER=admin
export GF_AUTH_GOOGLE_CLIENT_SECRET=admin
export GF_PLUGIN_GRAFANA_IMAGE_RENDERER_RENDERING_IGNORE_HTTPS_ERRORS=true
export GF_FEATURE_TOGGLES_ENABLE=newNavigation
export GF_PATHS_PROVISIONING=/etc/grafana/provisioning

grafana-server --config ./grafana.ini --homepath=/usr/share/grafana > grafana.log 2>&1 &

python3 import_dashboard.py