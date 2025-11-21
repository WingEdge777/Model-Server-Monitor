
export token=12345678

# write
# influxdb3 write \
#   --database test \
#   --token  token \
#   --precision s \ 
#   --accept-partial \
#   --file path/to/sensor_data 

######################################################### sample 

# query
influxdb3 query \
  --database test \
  --token  $token \
  "SELECT * FROM \"sglang:inter_token_latency_seconds\" ORDER BY time LIMIT 20"

influxdb3 query \
  --database test \
  --token  $token \
  "show tables"


influxdb3 query \
  --database test \
  --token  $token \
  "DESCRIBE prome_triton"

influxdb3 query \
  --database test \
  --token  $token \
  "SELECT * FROM 'prome_triton' limit 1;"


influxdb3 query \
  --database test \
  --token  $token \
  "SELECT nv_inference_pending_request_count FROM 'prome_triton' limit 1;"
# delete database
influxdb3 delete database test \