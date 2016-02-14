pwd := $(shell pwd)
bins := $(BIN)/mpg123 $(BIN)/swfextract

all: $(bins)

$(BIN)/mpg123:
	cd mpg123 && ./configure
	$(MAKE) -C mpg123
	ln -s $(pwd)/mpg123/src/mpg123 $@

$(BIN)/swfextract:
	cd swftools && ./configure
	$(MAKE) -C swftools
	ln -s $(pwd)/swftools/src/swfextract $@

clean:
	rm -f $(bins)
	$(MAKE) -C mpg123 clean
	$(MAKE) -C swftools clean

.PHONY: all clean
