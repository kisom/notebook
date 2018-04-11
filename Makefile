UPSTREAM :=	haven.dropsonde.net:sites/notebook/

all: build

sync: build deploy

build:
	raco pollen render -r source
	mkdir -p publish
	raco pollen publish source publish

deploy:
	rsync --progress -auv ./publish/ $(UPSTREAM)

setup:
	raco pkg install --auto pollen libuuid

clean:
	git clean -fxd
