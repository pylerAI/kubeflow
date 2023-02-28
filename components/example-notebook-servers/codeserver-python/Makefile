TAG ?= v1.2.1
REGISTRY ?= asia-northeast3-docker.pkg.dev/pyler-mlops/pyler-kubeflow-notebooks

docker-build-codeserver:
	make docker-build -C ../codeserver TAG=${TAG}

docker-build: docker-build-codeserver
	docker build -t ${REGISTRY}/codeserver-python:${TAG} --build-arg BASE_IMG=${REGISTRY}/codeserver:${TAG} -f Dockerfile .

docker-push:
	docker push ${REGISTRY}/codeserver-python:${TAG}
