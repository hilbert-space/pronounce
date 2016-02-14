export BIN := $(shell pwd)/bin

vendor:
	$(MAKE) -C vendor

clean:
	$(MAKE) -C vendor clean

.PHONY: vendor clean
