# Swift 3 - Ubuntu v14.04 - Docker

Docker image with the Swift 3.0 RELEASE binaries and dependencies for running Swift 3 applications. 

Using Dockerfile per guidelines in [Best practices for writing Dockerfiles](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/).

# Privilege mode
If you attempt to run the Swift REPL and you get the error `failed to launch REPL process: process launch failed: 'A' packet returned an error: 8`, then you should run your Docker container in privilege mode:

```
docker run --privileged -i -t ibmcom/swift-ubuntu:latest  /bin/bash
```

This issue is described at https://bugs.swift.org/browse/SR-54.
