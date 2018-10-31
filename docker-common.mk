IMAGE_NAME := $(shell basename $(CURDIR))
TAG  	   := $(shell git log -1 --pretty=format:%h)
BRANCH     ?= $(shell git rev-parse --abbrev-ref HEAD)
COMMIT      = $(shell git rev-parse --short HEAD)

.PHONY: base
base: ## Build the base docker image which is shared between the development and production images
	docker build -t $(IMAGE_NAME) -f Dockerfile .

.PHONY: image-nc
image-nc: ## Build image without caching
	docker build --no-cache -t $(IMAGE_NAME) .

.PHONY: image
image: ## Build the production image
	docker build \
        --label revision=$(COMMIT) \
        --label branch=$(BRANCH) \
        -t $(IMAGE_NAME):$(TAG) \
        -f Dockerfile \
        ./

.PHONY: clean
clean: ## Clean image 
	docker rmi -f $(IMAGE_NAME):$(TAG)

.PHONY: tag-latest
tag-latest: ## Tag the docker image as latest
	docker tag $(IMAGE_NAME) $(DOCKER_REPO)/$(IMAGE_NAME):latest

.PHONY: docker-publish
docker-publish: base image tag-latest ## Publish the image and tags to a repository.
	docker push $(DOCKER_REPO)/$(IMAGE_NAME):latest
