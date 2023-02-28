TAG ?= v1.2.1
REGISTRY ?= asia-northeast3-docker.pkg.dev/pyler-mlops/pyler-kubeflow-notebooks

docker-build-base:
	make docker-build -C ../base TAG=${TAG}

docker-build: docker-build-base
	docker build -t ${REGISTRY}/rstudio:${TAG} --build-arg BASE_IMG=${REGISTRY}/base:${TAG} -f Dockerfile .

docker-push:
	docker push ${REGISTRY}/rstudio:${TAG}
