.PHONY: all build test

VERSION:="v2.7"
BIN:="docker run -it -v \"${PWD}:/workspace\" jsonschema"

all: build test

build:
	eval ${BIN} fmt --ignore test
	eval ${BIN} lint --ignore test
	eval ${BIN} metaschema --ignore test
	eval ${BIN} bundle ${VERSION}/_root.json --resolve ${VERSION} --without-id > ${VERSION}/krakend.json
	eval ${BIN} fmt ${VERSION}/krakend.json

test:
	eval ${BIN} test ./test/${VERSION} --resolve ${VERSION}

