UPSTREAM :=	deimos.wntrmute.net:/var/www/sites/notes/

all: build

sync: build deploy

build:
	raco pollen render -r source
	mkdir -p publish
	raco pollen publish source publish

deploy: build
	rsync --progress -auv ./publish/ $(UPSTREAM)

preview:
	raco pollen start source

setup:
	raco pkg install --auto --skip-installed pollen libuuid

clean:
	git clean -fxd

.PHONY: all build clean deploy preview setup sync
