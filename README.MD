# MoMor

**MoMor** (**Mo**del service **Mo**nito**r**) is an out-of-the-box monitoring system deployment designed for popular model serving frameworks. It provides comprehensive observability and flexible alerting for your model serving system.

## Key Features

- **🚀 Out-of-the-Box Experience**
  Get started immediately with minimal configuration. Check out our [quick_start](./doc/quick_start.md) to see how easy it is.

- **🔌 Broad Framework Support**
  Seamlessly integrates with popular model serving systems, including:
  - [x] Triton Inference Server
  - [x] SGLang
    - copied SGLang demo
  - [x] vLLM
    - copied from vLLM demo
  - [ ] Text Embeddings Inference (TEI)
    - TODO
  - *Any service exposing a Prometheus metrics endpoint*
    - welcome PRs

- **🛡️ Robust Data Collection**
  Leverages the **OpenGraf Agent** for reliable and efficient metrics scraping and aggregation.

- **📊 Elegant Observability**
  Features stunning dashboards and proactive alerting built on top of **Grafana**, giving you deep insights into your model performance.

- **💾 High-Performance Storage**
  Utilizes **VictoriaMetrics** for fast, cost-saving, scalable, and long-term time-series data storage.

- **⚙️ Production-Ready**
  Ready for high availability (HA) deployments, delivering a robust, uninterrupted monitoring system.

## Quick Start

Considering you are working with model server machine, you can simplely use the docker images.

```bash
docker run -tid --name=momor --network=host --privileged -v ./workspace/:/workspace wingedge777/momor:latest bash
```

considering you have a model server (one of tritonserver, sglang, vllm, text-embedding-inference) running on host machine, and it expose /metrics endpoint.

```bash
docker exec -ti momor bash

bash script/main.sh
```

If you want to monitor a remote server, just change telegraf `urls` config.

## Advanced Usage

See [advance_usage](./doc/advance_usage.md)
