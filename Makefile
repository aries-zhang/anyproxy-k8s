.PHONY: run clean deploy

build:
	docker build . -t arieszhang/anyproxy:latest

run: clean
	docker run -d --name anyproxy -p "8001:8001" -p "8002:8002" arieszhang/anyproxy

clean:
	docker container rm -f anyproxy

publish: build
	docker push arieszhang/anyproxy

deploy:
	kubectl apply -f anyproxy.yaml

undeploy:
	kubectl delete -f anyproxy.yaml
