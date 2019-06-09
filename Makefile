SHELL := /bin/bash

DOCKER := alpine

ARCH := x86_64
VERSION := 3.9.4

TAG   := $(shell git rev-parse --abbrev-ref HEAD)
TOP := $(shell git rev-parse --show-toplevel)

.PHONY: all
all: 
	make build-local-all

pre:
	cd $(DOCKER) && wget -c http://dl-cdn.alpinelinux.org/$(DOCKER)/v3.9/releases/$(ARCH)/alpine-minirootfs-$(VERSION)-$(ARCH).tar.gz && \
		export ALPINE_ARCH=$(ARCH); export ALPINE_VERSION=$(VERSION); envsubst < Dockerfile.base | docker build --rm=true --force-rm -t "$(DOCKER)":"$(TAG)" -f - .

build-local-all: pre
	@for d in $$(git ls-files '*Dockerfile' | xargs -n1 dirname | LC_ALL=C sort | uniq); do \
	pushd $$d; \
	$(TOP)/scripts/build.local.sh; \
	popd; \
	done

run-local-all:
	@for f in $$(git ls-files '*local.sh' | uniq); do \
	./scripts/run.local.sh $${f}; \
	done

clean-all:
	@for d in $$(ls -d */ | grep -v scripts | cut -f1 -d'/');do \
	./scripts/clean.local.sh $${d}; \
	done
