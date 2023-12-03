build:

	 DOCKER_BUILDKIT=1 docker build  -t ubuntu-stress .

exec:

	docker run -it -u root ubuntu-stress bash

tag:

	docker tag ubuntu-stress <your_docker_repo>

push:

	docker push  <your_docker_repo>
