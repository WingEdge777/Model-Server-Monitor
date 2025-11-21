influxdb3 create token --admin

# New token created successfully!

# Token: 12345678
# HTTP Requests Header: Authorization: Bearer 12345678

export token=12345678

# create database
influxdb3 create database \
  --retention-period 30d \
  --token  $token \
  test