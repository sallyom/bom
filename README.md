## sbom-gen

Quick & easy tool for creating an [anchore/syft](https://github.com/anchore/syft/blob/main/README.md) Software Bill of Materials for an OCI image.
The sbom file is written as `sbom-imagename-digest` with `:` in digest as `-`.


Download sbom-gen

```bash
curl -o sbom-gen https://raw.githubusercontent.com/sallyom/bom/main/sbom-gen && chmod +x sbom-gen
```

Example

```bash
$ sbom-gen registry.access.redhat.com/ubi9/ubi-minimal:latest
syft -v registry.access.redhat.com/ubi9/ubi-minimal:latest -o github > sbom-ubi-minimal-sha256-a9df09298
[0000]  INFO syft version: 0.56.0
[0000]  INFO new version of syft is available: 0.57.0 (current version is 0.56.0)
[0004]  INFO identified distro: Red Hat Enterprise Linux 9.0 (Plow)
[0004]  INFO cataloging image
SBOM sbom-ubi-minimal-sha256-a9df09298
```

```bash
$ podman inspect registry.access.redhat.com/ubi9/ubi-minimal:latest
[
     {
          "Id": "e40ab9de8ea1ce72d1f474aed9b57e86077200fd3e70ef68e753987fac28d936",
          "Digest": "sha256:a9df0929861456151442affa821caa685d5faeeee7ae799125fe730fe1c5dd0c",
          "RepoTags": [
               "registry.access.redhat.com/ubi9/ubi-minimal:latest"
          ],
```

### quay.io/sallyom/syftbom:latest

```bash
$ podman images
REPOSITORY                                   TAG         IMAGE ID      CREATED         SIZE
quay.io/sallyom/syftbom                      latest      67b86ada6bf1  9 minutes ago   233 MB
```
