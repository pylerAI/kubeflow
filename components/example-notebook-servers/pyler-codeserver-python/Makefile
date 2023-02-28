TAG ?= v1.2.1
REGISTRY ?= asia-northeast3-docker.pkg.dev/pyler-mlops/pyler-kubeflow-notebooks

docker-build-codeserver:
	make docker-build -C ../codeserver-python TAG=${TAG}

docker-build: docker-build-codeserver
	docker build -t ${REGISTRY}/pyler-codeserver-python:${TAG} --build-arg BASE_IMG=${REGISTRY}/codeserver:${TAG} -f Dockerfile .

docker-push:
	docker push ${REGISTRY}/pyler-codeserver-python:${TAG}
