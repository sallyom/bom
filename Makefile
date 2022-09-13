# Export shell defined to support Ubuntu
export SHELL := $(shell which bash)

SRC_ROOT :=$(shell pwd)

CTR_CMD :=$(or $(shell which podman 2>/dev/null), $(shell which docker 2>/dev/null))
SYFTBOM_IMAGE :=quay.io/sallyom/syftbom:latest

syftbom_image: 
	@if [ -z '$(CTR_CMD)' ] ; then echo '!! ERROR: containerized builds require podman||docker CLI, none found $$PATH' >&2 && exit 1; fi
	$(CTR_CMD) build -f ./build/Dockerfile --tag $(SYFTBOM_IMAGE) --platform="linux/amd64" .
.PHONY: syftbom_image
