TAG ?= v1.2.1
REGISTRY ?= asia-northeast3-docker.pkg.dev/pyler-mlops/pyler-kubeflow-notebooks

docker-build-jupyter:
	make docker-build -C ../jupyter TAG=${TAG}

docker-build: docker-build-jupyter
	docker build -t ${REGISTRY}/jupyter-scipy:${TAG} --build-arg BASE_IMG=${REGISTRY}/jupyter:${TAG} -f Dockerfile .

docker-push:
	docker push ${REGISTRY}/jupyter-scipy:${TAG}
