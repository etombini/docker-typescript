
REGISTRY ?= etombini
IMAGE    ?= typescript
VERSION   = $(shell git describe --tags --always --dirty 2> /dev/null || echo "0.0.0")


show-version: 
	@echo $(VERSION)

show-usage: 
	@echo "docker run -i -t --rm=true -v \$$(pwd):/app typescript tsc --help"

build: Dockerfile
	docker build -t $(REGISTRY)/$(IMAGE):$(VERSION) .
	docker tag $(REGISTRY)/$(IMAGE):$(VERSION) $(REGISTRY)/$(IMAGE):$(VERSION)
	docker tag $(REGISTRY)/$(IMAGE):$(VERSION) $(REGISTRY)/$(IMAGE):latest

push: Dockerfile
	docker push $(REGISTRY)/$(IMAGE):$(VERSION)
	docker push $(REGISTRY)/$(IMAGE):latest
