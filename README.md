# Stress testing in Kubernetes

Very simple implementation of [stress](https://github.com/resurrecting-open-source-projects/stress) - tool to impose load on and stress test systems - for Kubernetes, after succesfull stress test the pod will be in status `Completed`.

Actually I am using in Dockerfile `ubuntu:latest`

For the specific optimalization on your cluster and node/s, read the [man](https://linux.die.net/man/1/stress) and update `args` and `resource - limits/requests` in `job.yaml`.

## Docker Hub

Docker images for the `debian:latest` and `ubuntu:latest`

[lostcauze7/debian-stress](https://hub.docker.com/repository/docker/lostcauze7/debian-stress)

[lostcauze7/ubuntu-stress](https://hub.docker.com/repository/docker/lostcauze7/ubuntu-stress)

# Local development:

```bash
make build #build docker image
make exec  #exec to docker image
make tag   #tag docker image
make push  #push docker image
```

# Deploy

Do not forget to update the args and resource & limits! afterwards:

```bash
kubectl apply -f job.yaml -n <namespace>
```
