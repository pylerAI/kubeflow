TAG ?= v1.2.1
REGISTRY ?= asia-northeast3-docker.pkg.dev/pyler-mlops/pyler-kubeflow-notebooks

docker-build-rstudio:
	make docker-build -C ../rstudio TAG=${TAG}

docker-build: docker-build-rstudio
	docker build -t ${REGISTRY}/rstudio-tidyverse:${TAG} --build-arg BASE_IMG=${REGISTRY}/rstudio:${TAG} -f Dockerfile .

docker-push:
	docker push ${REGISTRY}/rstudio-tidyverse:${TAG}
