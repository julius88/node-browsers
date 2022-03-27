# This Makefile contains scripts to build node-browsers.
.PHONY: help


help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)


build-local: ## Build Docker image and store it locally.
	docker build --rm -t juliusleppala/node-browsers:latest .


build: ## Build Docker image and push it to Docker Hub.
	docker buildx create --name ci-helper || true
	docker buildx use ci-helper
	docker buildx build \
    	--platform linux/amd64 \
    	--cache-from=type=registry,ref=juliusleppala/node-browsers:latest-cache \
    	--cache-to=type=registry,ref=juliusleppala/node-browsers:latest-cache,mode=max \
      	-t juliusleppala/node-browsers:latest \
      	--push \
      	.
