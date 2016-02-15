export BIN := $(shell pwd)/bin

all: Gemfile.lock vendor

Gemfile.lock: Gemfile
	bundle

vendor:
	$(MAKE) -C vendor

clean:
	$(MAKE) -C vendor clean

.PHONY: all vendor clean
