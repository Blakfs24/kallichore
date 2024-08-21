#!/usr/bin/env bash

# Test to see if openapi-generator is installed
if ! command -v openapi-generator &> /dev/null
then
    echo "openapi-generator could not be found"
    echo "Please install openapi-generator-cli"
    echo "https://openapi-generator.tech/docs/installation"
    exit
fi

# Get the path to this script
DIR="$( dirname -- "${BASH_SOURCE[0]}"; )";

# Move to the directory containing the API implementation
cd $DIR/../crates/kallichore_api

# Generate the API
openapi-generator generate -i ../../kallichore.json -g rust-server --additional-properties=packageName=kallichore_api

# Format all of the generated Rust code
cargo fmt
