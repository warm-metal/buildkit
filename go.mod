module github.com/moby/buildkit

go 1.13

require (
	github.com/AkihiroSuda/containerd-fuse-overlayfs v1.0.1
	github.com/BurntSushi/toml v0.3.1
	github.com/Microsoft/go-winio v0.4.17-0.20210211115548-6eac466e5fa3
	github.com/Microsoft/hcsshim v0.8.15
	github.com/codahale/hdrhistogram v0.0.0-20160425231609-f8ad88b59a58 // indirect
	github.com/containerd/console v1.0.1
	github.com/containerd/containerd v1.5.0-beta.3.0.20210309150730-ddf6594fbeed
	github.com/containerd/continuity v0.0.0-20210208174643-50096c924a4e
	github.com/containerd/go-cni v1.0.1
	github.com/containerd/go-runc v0.0.0-20201020171139-16b287bc67d0
	github.com/containerd/stargz-snapshotter v0.4.1
	github.com/containerd/typeurl v1.0.1
	github.com/coreos/go-systemd/v22 v22.1.0
	github.com/docker/cli v20.10.0-beta1.0.20201029214301-1d20b15adc38+incompatible
	github.com/docker/distribution v2.7.1+incompatible
	github.com/docker/docker v20.10.0-beta1.0.20201110211921-af34b94a78a1+incompatible
	github.com/docker/go-connections v0.4.0
	github.com/docker/libnetwork v0.8.0-dev.2.0.20200917202933-d0951081b35f
	github.com/gofrs/flock v0.7.3
	github.com/gogo/googleapis v1.4.0
	github.com/gogo/protobuf v1.3.2
	// protobuf: the actual version is replaced in replace()
	github.com/golang/protobuf v1.4.3
	github.com/google/go-cmp v0.5.4
	github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
	github.com/gorilla/mux v1.8.0 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.2.0
	github.com/grpc-ecosystem/grpc-opentracing v0.0.0-20180507213350-8e809c8a8645
	github.com/hashicorp/go-immutable-radix v1.0.0
	github.com/hashicorp/golang-lru v0.5.3
	github.com/hashicorp/uuid v0.0.0-20160311170451-ebb0a03e909c // indirect
	github.com/ishidawataru/sctp v0.0.0-20191218070446-00ab2ac2db07 // indirect
	github.com/jaguilar/vt100 v0.0.0-20150826170717-2703a27b14ea
	github.com/mitchellh/hashstructure v1.0.0
	github.com/moby/locker v1.0.1
	github.com/moby/sys/mount v0.2.0 // indirect; force more current version of sys/mount than go mod selects automatically
	github.com/moby/sys/mountinfo v0.4.1 // indirect; force more current version of sys/mountinfo than go mod selects automatically
	github.com/moby/term v0.0.0-20200915141129-7f0af18e79f2 // indirect
	github.com/morikuni/aec v1.0.0
	github.com/opencontainers/go-digest v1.0.0
	github.com/opencontainers/image-spec v1.0.1
	github.com/opencontainers/runc v1.0.0-rc93
	github.com/opencontainers/runtime-spec v1.0.3-0.20200929063507-e6143ca7d51d
	github.com/opencontainers/selinux v1.8.0
	github.com/opentracing-contrib/go-stdlib v1.0.0
	github.com/opentracing/opentracing-go v1.2.0
	github.com/pkg/errors v0.9.1
	github.com/pkg/profile v1.5.0
	github.com/serialx/hashring v0.0.0-20190422032157-8b2912629002
	github.com/sirupsen/logrus v1.7.0
	github.com/stretchr/testify v1.7.0
	github.com/tonistiigi/fsutil v0.0.0-20201103201449-0834f99b7b85
	github.com/tonistiigi/units v0.0.0-20180711220420-6950e57a87ea
	github.com/uber/jaeger-client-go v2.25.0+incompatible
	github.com/uber/jaeger-lib v2.2.0+incompatible // indirect
	github.com/urfave/cli v1.22.2
	go.etcd.io/bbolt v1.3.5
	golang.org/x/crypto v0.0.0-20201117144127-c1f2f97bffc9
	golang.org/x/net v0.0.0-20201224014010-6772e930b67b
	golang.org/x/sync v0.0.0-20201207232520-09787c993a3a
	golang.org/x/sys v0.0.0-20210124154548-22da62e12c0c
	golang.org/x/time v0.0.0-20200630173020-3af7569d3a1e
	// genproto: the actual version is replaced in replace()
	google.golang.org/genproto v0.0.0-20201110150050-8816d57aaa9a
	// grpc: the actual version is replaced in replace()
	google.golang.org/grpc v1.35.0
)

replace (
	// protobuf: corresponds to containerd
	github.com/golang/protobuf => github.com/golang/protobuf v1.3.5
	github.com/hashicorp/go-immutable-radix => github.com/tonistiigi/go-immutable-radix v0.0.0-20170803185627-826af9ccf0fe
	github.com/jaguilar/vt100 => github.com/tonistiigi/vt100 v0.0.0-20190402012908-ad4c4a574305
	// genproto: corresponds to containerd
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20200224152610-e50cd9704f63
	// grpc: corresponds to protobuf
	google.golang.org/grpc => google.golang.org/grpc v1.30.0
)
