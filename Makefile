prefix=/usr/local
bindir=$(prefix)/bin

binaries: FORCE
	hack/binaries

images: FORCE
# moby/buildkit:local and moby/buildkit:local-rootless are created on Docker
	hack/images local docker.io/warmmetal/buildkit
	TARGET=rootless hack/images local docker.io/warmmetal/buildkit

dev-images: FORCE
# moby/buildkit:local and moby/buildkit:local-rootless are created on Docker
	hack/images-dev local docker.io/warmmetal/buildkit
	TARGET=rootless hack/images-dev local docker.io/warmmetal/buildkit

install: FORCE
	mkdir -p $(DESTDIR)$(bindir)
	install bin/* $(DESTDIR)$(bindir)

clean: FORCE
	rm -rf ./bin

test:
	./hack/test integration gateway dockerfile

lint:
	./hack/lint

validate-vendor:
	./hack/validate-vendor

validate-shfmt:
	./hack/validate-shfmt

shfmt:
	./hack/shfmt

validate-generated-files:
	./hack/validate-generated-files

validate-all: test lint validate-vendor validate-generated-files

vendor:
	./hack/update-vendor

generated-files:
	./hack/update-generated-files

.PHONY: vendor generated-files test binaries images dev-images install clean lint validate-all validate-vendor validate-generated-files
FORCE:
