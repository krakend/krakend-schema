.PHONY: all build test

VERSION?="v3.0"
BIN?="docker run -i --rm -v \"${PWD}:/workspace\" ghcr.io/sourcemeta/jsonschema:v14.6.0"

all: build test

build:
	eval ${BIN} fmt --ignore test --extension .json
	eval ${BIN} lint --fix --ignore test --ignore ${VERSION}/krakend.json --extension .json --resolve ${VERSION} -x top_level_examples -x top_level_description -x simple_properties_identifiers -x orphan_definitions -x description_trailing_period *.json ./${VERSION}
	eval ${BIN} metaschema --ignore test --extension .json
	eval ${BIN} bundle ${VERSION}/_root.json --resolve ${VERSION} --without-id > ${VERSION}/krakend.json 2>/dev/null
	eval ${BIN} fmt ${VERSION}/krakend.json
	eval ${BIN} lint --fix --extension .json --resolve ${VERSION} -x top_level_examples -x top_level_description -x simple_properties_identifiers -x description_trailing_period ./${VERSION}/krakend.json

test:
	eval ${BIN} test ./test/${VERSION} --resolve ${VERSION}
