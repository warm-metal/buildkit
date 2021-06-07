# BuildKit

BuildKit is an awesome project to build oci container images.

This project adds features to help buildkit use host containerd as its worker, 
such that it can share images and snapshots with host containerd, and export new images to host containerd.

With these features, users can deploy the buildkit container to k8s clusters,
and use containerd on nodes as its worker.

The privileged image is available on [DockerHub](https://hub.docker.com/r/warmmetal/buildkit). Fell free to test.

## Installation

Run the commands below to install buildkit in a k8s cluster.
```shell script
kubectl create ns buildkit-system
kubectl -n buildkit-system create cm buildkitd.toml --from-file=install/buildkitd.toml
kubectl apply -f install/buildkit.yaml
```

Buildkit exposes its service on tcp port 2375. Users can use it via `buildctl` or other compatible clients.

## Features

- [Sharing volumes between buildkit and host containerd](#sharing-volumes-between-buildkit-and-host-containerd)
- [HTTP_PROXY support in image building](#http_proxy-support-in-image-building)
- [Multi-Arch image building](#multi-arch-image-building)

#### Sharing volumes between buildkit and host containerd

[PR#1](https://github.com/warm-metal/buildkit/pull/1),
[PR#4](https://github.com/warm-metal/buildkit/pull/4),
[PR#8](https://github.com/warm-metal/buildkit/pull/8)

Both buildkit and containerd need to access snapshots created by each other.
Therefore, we must mount the containerd root to the buildkit pod and also bind the buildkit root to the host.

And, the official buildkit saves contents of context, secrets and static qemu emulator in temporary folders that are
only visible in the pod whiling mounting them. These folders should also be available to the host containerd.
A new configuration `local-mount-source-root` is added to indicate a directory instead of `/tmp` as the parent folder of these contents.
This directory should be mounted to the same host path.

#### HTTP_PROXY support in image building

[PR#2](https://github.com/warm-metal/buildkit/pull/2)

Image building may always fail on package installation or fetching building dependencies in a poor network.
With this feature, buildkit will retrieve its HTTP_PROXY environment variables and set them while executing `RUN` directives of a Dockerfile.
Users can set HTTP_PROXY environment variables to the pod of buildkit to enable proxy.
The supported envs are HTTP_PROXY, HTTPS_PROXY, NO_PROXY in both lowercase and uppercase.

#### Multi-Arch image building

The official buildkit image has qemu-static binaries included to support multi-arch image building.
If users has interpreters installed on the worker node for different architectures via [`binfmt_misc`](https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.html),
the particular interpreter will be used to execute `RUN` directives on the corresponding architecture.
Otherwise, the built-in binaries will be used instead.

Unfortunately, the built-in binaries won't work well on all cases. It may throws strange errors sometimes.
For example, running `apk add bash` may throws the following error.
```shell script
 > [2/2] RUN apk add --no-cache bash:
#5 0.347 fetch https://dl-cdn.alpinelinux.org/alpine/v3.13/main/armv7/APKINDEX.tar.gz
#5 1.211 fetch https://dl-cdn.alpinelinux.org/alpine/v3.13/community/armv7/APKINDEX.tar.gz
#5 2.136 (1/4) Installing ncurses-terminfo-base (6.2_p20210109-r0)
#5 2.220 (2/4) Installing ncurses-libs (6.2_p20210109-r0)
#5 2.308 (3/4) Installing readline (8.1.0-r0)
#5 2.380 (4/4) Installing bash (5.1.0-r0)
#5 2.494 Executing bash-5.1.0-r0.post-install
#5 2.500 ERROR: bash-5.1.0-r0.post-install: script exited with error 1
#5 2.502 Executing busybox-1.32.1-r6.trigger
#5 2.550 1 error; 5 MiB in 18 packages
```
To fix this kind of failure, users need to install interpreters(like Docker did) via `binfmt_misc`,
or update the built-in qemu-static binaries.
Both https://github.com/tonistiigi/binfmt and https://github.com/multiarch/qemu-user-static can help.
I would recommend the former repo.