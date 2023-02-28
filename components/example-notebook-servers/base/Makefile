TAG ?= v1.2.1
REGISTRY ?= asia-northeast3-docker.pkg.dev/pyler-mlops/pyler-kubeflow-notebooks

docker-build:
	docker build -t ${REGISTRY}/base:${TAG} -f Dockerfile .

docker-push:
	docker push ${REGISTRY}/base:${TAG}
