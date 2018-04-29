SHELL := /bin/bash
TOP   := $(shell git rev-parse --show-toplevel)
TAG   := $(shell git rev-parse --abbrev-ref HEAD)

.PHONY: all

all:
	make build-all run-local-all

build-all:
	@for d in $$(ls -d */ | grep -v scripts | cut -f1 -d'/');do \
	pushd $$d; \
	$(TOP)/scripts/build.env.sh; \
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
