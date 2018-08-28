SHELL := /bin/bash
TOP   := $(shell git rev-parse --show-toplevel)
TAG   := $(shell git rev-parse --abbrev-ref HEAD)

.PHONY: all

all:
	make build-all 

build-all:
	@for d in $$(ls -d */ | grep -v scripts | cut -f1 -d'/');do \
	pushd $$d; \
	$(TOP)/scripts/build.env.sh; \
	popd; \
	done

push-all:
	@for d in $$(ls -d */ | grep -v scripts | cut -f1 -d'/');do \
	pushd $$d; \
	$(TOP)/scripts/push.env.sh $$d; \
	popd; \
	done

run-local-all:
	@for f in $$(git ls-files '*local.sh' | uniq); do \
	$(TOP)/scripts/run.local.sh $${f}; \
	done

clean-all:
	@for d in $$(ls -d */ | grep -v scripts | cut -f1 -d'/');do \
	$(TOP)/scripts/clean.local.sh $${d}; \
	done
