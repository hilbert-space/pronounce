export BIN := $(shell pwd)/bin

vendor:
	$(MAKE) -C vendor

.PHONY: vendor
