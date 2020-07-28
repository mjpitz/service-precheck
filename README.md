# service-precheck
![Google Analytics](https://www.google-analytics.com/collect?v=1&tid=UA-172921913-1&cid=555&t=pageview&ec=repo&ea=open&dp=service-precheck&dt=service-precheck)

Simple init container that ensures upstream services are ready before starting the primary container of a pod.
This implementation is largely based on Alibaba's blog post on how to solve service dependencies in Kubernetes.

[Alibaba Cloud's Blog Post](https://www.alibabacloud.com/blog/kubernetes-demystified-solving-service-dependencies_594110)

In order to use this container to precheck services, your upstream systems should have liveness and readiness probes configured.

## Status

![GitHub](https://img.shields.io/github/license/mjpitz/service-precheck.svg)
[![Image Layers](https://images.microbadger.com/badges/image/mjpitz/service-precheck.svg)](https://microbadger.com/images/mjpitz/service-precheck)
[![Image Version](https://images.microbadger.com/badges/version/mjpitz/service-precheck.svg)](https://microbadger.com/images/mjpitz/service-precheck)

# Getting Started

Try out the container using a quick docker run command:

```
$ docker run -it --rm mjpitz/service-precheck google.com amazon.com
[google.com] checking for a dns entry
Server:		192.168.65.1
Address:	192.168.65.1#53

Non-authoritative answer:
Name:	google.com
Address: 172.217.9.142

[amazon.com] checking for a dns entry
Server:		192.168.65.1
Address:	192.168.65.1#53

Non-authoritative answer:
Name:	amazon.com
Address: 176.32.103.205
Name:	amazon.com
Address: 176.32.98.166
Name:	amazon.com
Address: 205.251.242.103
```

Or try it within a Kubernetes cluster:

```
$ kubectl run -it --restart=Never --image mjpitz/service-precheck precheck -- kubernetes google.com amazon.com
$ kubectl logs -f precheck
[kubernetes] checking for a dns entry
Server:		10.43.0.10
Address:	10.43.0.10#53

Name:	kubernetes.default.svc.cluster.local
Address: 10.43.0.1

[google.com] checking for a dns entry
Server:		10.43.0.10
Address:	10.43.0.10#53

Non-authoritative answer:
Name:	google.com
Address: 216.58.194.78

[amazon.com] checking for a dns entry
Server:		10.43.0.10
Address:	10.43.0.10#53

Non-authoritative answer:
Name:	amazon.com
Address: 205.251.242.103
Name:	amazon.com
Address: 176.32.103.205
Name:	amazon.com
Address: 176.32.98.166
$ kubectl delete pod precheck
```

Once you've tried it out, you can add it to your deployment configuration:

```
    spec:
      initContainers:
      - name: service-precheck
        image: mjpitz/service-precheck:latest
        imagePullPolicy: IfNotPresent
        args:
        - "kubernetes"
        - "google.com"
        - "amazon.com"
```

More to come later.
