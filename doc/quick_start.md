# Quick Start

start docker container.

```bash
docker run -tid --name=momor --network=host --privileged -v $(pwd)/workspace/:/workspace wingedge777/momor:latest bash
```

considering you have a model server (one of tritonserver, sglang, vllm, text-embedding-inference) running on host machine, and it expose /metrics endpoint.

```bash
docker exec -ti momor bash

bash script/main.sh
```
