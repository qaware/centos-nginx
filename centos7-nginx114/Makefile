NGINX_VERSION=1.14.2
CENTOS_VERSION=7.5.1804
RPM_NAME=7/x86_64/RPMS/nginx-1.14.0-1.el7_4


docker:
	docker build --build-arg RPM_NAME=${RPM_NAME} --build-arg CENTOS_VERSION=${CENTOS_VERSION} -t centos-nginx:${CENTOS_VERSION}-${NGINX_VERSION} .

tag: docker
	docker tag centos-nginx:${CENTOS_VERSION}-${NGINX_VERSION} qaware/centos-nginx:${CENTOS_VERSION}-${NGINX_VERSION}
	docker push qaware/centos-nginx:${CENTOS_VERSION}-${NGINX_VERSION}

latest: tag
	docker tag centos-nginx:${CENTOS_VERSION}-${NGINX_VERSION} qaware/centos-nginx:latest
	docker push qaware/centos-nginx:latest
