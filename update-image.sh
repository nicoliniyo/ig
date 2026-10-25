#!/bin/bash

set -e

# Resolve the script's own directory so it runs correctly from anywhere
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Build from the ig/ directory (build context), using ig/Dockerfile,
# and apply the canonical tag.
docker build -t todoopen-fhir:latest "$script_dir"
