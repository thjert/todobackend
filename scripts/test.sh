#!/bin/bash

. /appenv/bin/activate


# Download requirements to build cache

pip download -d /build -r requirements_test.txt --no-input

pip install --no-index -f /build -r requirements_test.txt


exec "$@"
