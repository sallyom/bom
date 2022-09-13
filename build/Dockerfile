# build from repo root/Makefile
FROM registry.access.redhat.com/ubi8/go-toolset as builder
WORKDIR /opt
USER root
COPY . .
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin 

FROM registry.access.redhat.com/ubi9/ubi-minimal:latest
USER root
WORKDIR /opt
RUN microdnf install -y skopeo && microdnf clean all

COPY --from=builder /opt/build/bom.sh /usr/local/bin/bom
COPY --from=builder /usr/local/bin/syft /usr/local/bin/syft

ENTRYPOINT [ "/usr/local/bin/bom" ]
