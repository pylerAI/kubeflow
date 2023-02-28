IMG ?= centraldashboard-angular
TAG ?= v1.2.1
COMMIT = $(shell git rev-parse HEAD)

# To build without the cache set the environment variable
# export DOCKER_BUILD_OPTS=--no-cache
docker-build:
	docker build ${DOCKER_BUILD_OPTS} -t $(IMG):$(TAG) . \
	  --build-arg kubeflowversion=$(shell git describe --abbrev=0 --tags) \
	  --build-arg commit=$(COMMIT) \
      --label=git-verions=$(TAG)

docker-push:
	docker push $(IMG):$(TAG)