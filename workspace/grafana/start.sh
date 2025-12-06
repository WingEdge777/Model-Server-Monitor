export GF_DEFAULT_INSTANCE_NAME=my-instance
export GF_SECURITY_ADMIN_USER=admin
export GF_AUTH_GOOGLE_CLIENT_SECRET=admin
export GF_PLUGIN_GRAFANA_IMAGE_RENDERER_RENDERING_IGNORE_HTTPS_ERRORS=true
export GF_FEATURE_TOGGLES_ENABLE=newNavigation
mkdir -p /var/lib/grafana/dashboards && cp ./dashboards/* /var/lib/grafana/dashboards/
grafana-server --config ./grafana.ini --homepath=/usr/share/grafana > grafana.log 2>&1 &