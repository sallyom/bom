#!/bin/sh

image=${1:-quay.io/sallyom/syftbom:latest}
format=${2:-github}

DIGEST=$(skopeo inspect --format "{{.Digest}}" docker://$image | sed 's/:/-/g')
NAME=$(echo $image | awk -F"/" '{print $NF}' | awk -F":" '{print $1}')

echo "syft -v $image -o $format > sbom-$NAME-$DIGEST"
syft -v $image -o $format > sbom-$NAME-$DIGEST

echo "SBOM sbom-$NAME-$DIGEST"
