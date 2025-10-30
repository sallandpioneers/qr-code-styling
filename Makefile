.PHONY: build docker-build docker-run clean help

# Docker image name
IMAGE_NAME := my-node-app

# Help target
help:
	@echo "Available targets:"
	@echo "  docker-build  - Build the Docker image"
	@echo "  build         - Run webpack build in Docker container with volume mount"
	@echo "  clean         - Remove the Docker image"
	@echo "  help          - Show this help message"

# Build the Docker image
docker-build:
	docker build -t $(IMAGE_NAME) .

# Run webpack build with volume mount to sync lib folder back to host
build: docker-build
	docker run --rm -v $$(pwd):/app $(IMAGE_NAME) npm run build

# Clean up Docker image
clean:
	docker rmi $(IMAGE_NAME)