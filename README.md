# k8s-service-precheck

Simple init container that ensures upstream services are ready before starting the primary container of a pod.
This implementation is largely based on Alibaba's blog post on how to solve service dependencies in Kubernetes.

[Alibaba Cloud's Blog Post](https://www.alibabacloud.com/blog/kubernetes-demystified-solving-service-dependencies_594110)

## Status

[![Image Layers](https://images.microbadger.com/badges/image/indeedoss/cluster-preset.svg)](https://microbadger.com/images/indeedoss/cluster-preset)
[![Image Version](https://images.microbadger.com/badges/version/indeedoss/cluster-preset.svg)](https://microbadger.com/images/indeedoss/cluster-preset)
