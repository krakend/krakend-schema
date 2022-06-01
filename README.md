## Schema validation for KrakenD configuration files
This repository contains the source code used to publish KrakenD's configuration schema. The official KrakenD schema lives under `https://www.krakend.io/schema/v3.json`. If you are looking to validate your endpoints' JSON schema, see [JSON-schema validation](https://www.krakend.io/docs/endpoints/json-schema/).

**You must use KrakenD v2.0 and higher.**

KrakenD uses this schema automatically during the `krakend check --lint` command, but we advise you to use it in your IDE to assist you during development. Some of the features IDEs offer while working with JSON-schema is:

- Automatic validation as you type
- Show documentation of attributes
- Linting and syntax errors
- Warning for wrong types
- Autocompletion of properties

In most modern editors, **there is nothing you need to install** as they have built-in json schema validation. Visual Studio Code, Android Studio, JetBrains editors (PHPStorm, PyCharm, GoLand, WebStorm, IntelliJ IDEA...), or Eclipse, to name a few examples.

To use this schema add the `$schema` attribute in your configuration files. There is no need to clone this repo unless you'd like to submit a pull request:

    {
        "$schema": "https://www.krakend.io/schema/v3.json",
        "version": 3,
        "endpoints": [
            ...
        ]
    }

![IDE Integration](https://www.krakend.io/images/documentation/krakend-ide-integration.png)

You can also use sub-schemas if needed. The `v3.json` file is the main schema that references other sub-schemas with the `$ref` attribute.

For more information visit [IDE integration](https://www.krakend.io/docs/enterprise/developer/ide-integration/)

If you find any inconsistency in the schema, please **open an issue or pull request**.