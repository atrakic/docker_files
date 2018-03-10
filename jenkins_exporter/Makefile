IMAGENAME?=$(shell basename "$$PWD")
TAG?=$(shell git rev-parse --abbrev-ref HEAD)
JENKINS_SERVER?=http://localhost
JENKINS_USER?=admin
JENKINS_PASSWORD?=admin

debug: image
	docker run --rm -p 9118:9118 \
  -e DEBUG=1 \
  -e JENKINS_SERVER=$(JENKINS_SERVER) \
  -e JENKINS_USER=$(JENKINS_USER) \
  -e JENKINS_PASSWORD=$(JENKINS_PASSWORD) \
  -e VIRTUAL_PORT=9118 $(IMAGENAME):$(TAG)

image:
	docker build -t $(IMAGENAME):$(TAG) .

push: image
	docker push $(IMAGENAME):$(TAG)

.PHONY: image push debug
