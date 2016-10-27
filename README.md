# NiFi ![](https://images.microbadger.com/badges/version/xemuliam/nifi:1.0.0.svg) ![](https://images.microbadger.com/badges/image/xemuliam/nifi:1.0.0.svg)

[Docker](https://www.docker.com/what-docker) image for [Apache NiFi](https://nifi.apache.org/).

Created from NiFi [base image](https://hub.docker.com/r/xemuliam/nifi-base) to minimize traffic and deployment time in case of changes should be applied on top of NiFi


## Why base image is required?

DockerHub does not caching image layers. Thus creation of base image (with pure NiFi) mitigates this issue and let us to experiment with NiFi settings w/o downloading full NiFi archive (more than 800MB) each time when we change smth. Only our changes will be pulled out from Docker Hub.

                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o   NiFi    __/
             \    \   1.0.0 __/
              \____\_______/


# Overview

Dockerized and parametrized single- and multi-host NiFi.
Scalability is supported.
SSL implementation sholud be the next step.

Deployment options:
- Standalone NiFi node (by default built directly from image)
- Single-host NiFi cluster (within sigle docker-machine) with 
- Multi-host NiFi cluster


## Migration from 0.7.0

All required information can be found [here](http://cwiki.apache.org/confluence/display/NIFI/Migration+Guidance)


## Ports

- 2881 - NiFi site to site communication port
- 2882 - NiFi cluster node protocol port
- 2181 - Zookeeper client port
- 2888 - Zookeeper port for monitoring NiFi nodes availability
- 3888 - Zookeeper port for NiFi Cluster Coordinator election


## Exposed ports

- 8080 - NiFi web application port
- 8443 - NiFi web application secure port
- 8081 - NiFi ListenHTTP processor port


## Official Apache NiFi Documentation and Guides

- [Overview](https://nifi.apache.org/docs.html)
- [User Guide](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html)
- [Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html)
- [Development Quickstart](https://nifi.apache.org/quickstart.html)
- [Developer's Guide](https://nifi.apache.org/developer-guide.html)
- [System Administrator](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html)


## ListenHTTP Processor

The standard library has a built-in processor for an HTTP endpoint listener. That processor is named [ListenHTTP](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi.processors.standard.ListenHTTP/index.html). You should set the *Listening Port* of the instantiated processor to `8081` if you follow the instructions from above.


# Usage

This image can either be used as a image for building on top of NiFi or just to experiment with. I personally have not attempted to use this in a production use case.


## Pre-Requisites
Ensure the following pre-requisites are met (due to some blocker bugs in earlier versions). As of today, the latest Docker Toolbox and Homebrew are fine.

- Docker 1.10+
- Docker Compose 1.6.1+
- Docker Machine 0.6.0+

(all downloadable as a single [Docker Toolbox](https://www.docker.com/products/docker-toolbox) package as well)


## How to use from Kitematic

1. Start Kitematic
2. Enter `xemuliam` in serach box
3. Choose `nifi` image
4. Click `Create` button

Kitematic will assign all ports and you'll be able to run HDF web-interface directly from Kitematic.


## How to use from Docker CLI

1. Start Docker Quickstart Terminal
2. Run command  `docker run -d -p 8080:8080 -p 8081:8081 -p 8443:8443 xemuliam/nifi`
3. Check Docker machine IP  `docker-machine ls`
4. Use IP from previous step in address bar of your favorite browser, e.g. `http://192.168.99.100:8080/nifi`


## How to use NiFi in cluster mode

Please read [explanation](https://github.com/xemuliam/docker-nifi/blob/1.0.0/README.Cluster.md).


# Enjoy! :)
