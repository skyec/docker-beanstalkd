.PHONY: image run rm kill ps port

image: Dockerfile
	docker build -t skyec/beanstalkd:latest .

run:
	docker run -d --name beanstalkd -p '0.0.0.0:11300:11300' skyec/beanstalkd

rm:
	docker rm beanstalkd

kill:
	docker kill beanstalkd

ps:
	docker ps --filter='name=beanstalkd'	

port:
	@echo $$(docker-machine ip default):$$(docker inspect --format='{{ range $$p, $$c := .HostConfig.PortBindings  }}{{ (index $$c 0).HostPort  }}{{ end  }}' beanstalkd)
