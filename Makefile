.PHONY: build run clean

build:
	docker-compose build

up: clean
	docker-compose up

down:
	docker-compose down

clean:
	sudo rm -rf src/diagrams/* docs/images/* docs/diagrams/*.md
