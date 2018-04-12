UPSTREAM :=	haven.dropsonde.net:sites/notebook/

all: build

sync: build deploy

build:
	raco pollen render -r source
	mkdir -p publish
	raco pollen publish source publish

deploy:
	rsync --progress -auv ./publish/ $(UPSTREAM)

preview:
	raco pollen start source

setup:
	raco pkg install --auto --skip-installed pollen libuuid

clean:
	git clean -fxd

.PHONY: all build clean deploy preview setup sync
