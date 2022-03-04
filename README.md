## Schema validation for KrakenD configuration files
This repository contains the source code used to publish KrakenD's configuration schema, which is published under https://www.krakend.io/schema/v3.json

To make use of this Schema add the `$schema` attribute in your configuration files as follows:

    {
        "$schema": "http://www.krakend.io/schema/v3.json",
        "version": 3,
        "endpoints": [
            ...
        ]
    }