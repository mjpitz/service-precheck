docker:
	docker build -t mjpitz/service-precheck:latest .

dockerx:
	docker buildx rm mjpitz--service-precheck || echo "mjpitz--service-precheck does not exist"
	docker buildx create --name mjpitz--service-precheck --use
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t mjpitz/service-precheck:latest .
