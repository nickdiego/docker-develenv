all: build

DOCKER = docker
IMAGE = nickdiego/develenv

build:
	$(DOCKER) build -t $(IMAGE):$(shell cat VERSION) .

run: build
	sh start.sh

