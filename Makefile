UPSTREAM :=	haven.dropsonde.net:sites/notebook/

all: build

sync: build deploy

build:
	raco pollen render
	raco pollen publish

deploy:
	rsync --progress -auv ./ $(UPSTREAM)

setup:
	raco pkg install --auto pollen libuuid

clean:
	git clean -fxd
