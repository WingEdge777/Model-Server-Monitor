# test /metrics endpoint before run this
# curl http://10.60.105.3:8000/metrics

telegraf --config ./sgl.conf > sgl.log 2>&1 &
telegraf --config ./ts.conf > triton.log 2>&1 &
telegraf --config ./vllm.conf > vllm.log 2>&1 &
telegraf --config ./tei.conf > tei.log 2>&1 &

