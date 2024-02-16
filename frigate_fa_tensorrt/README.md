# Home Assistant Add-on: Frigate (Full Access)

Please reference the [release notes](https://github.com/blakeblackshear/frigate/releases) for breaking changes.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armv7 Architecture][armv7-shield]

NVR with realtime local object detection for IP cameras.

You must create a config file as `frigate.yml` in the root of your Home Assistant configuration directory.

This version of the add-on requests full device access in order to turn off protection mode for those devices which don't work with protection mode enabled.

[Documentation](https://docs.frigate.video)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg

# NVIDIA RUNTIME

You can't configure single addons to run with the nvidia-runtime. An option, however, is to configure the nvidia-runtime as the default, e.g.:
```
{
    "log-driver": "journald",
    "storage-driver": "overlay2",
    "ip6tables": true,
    "experimental": true,
    "default-shm-size" : "128M",
    "log-opts": {
        "tag": "{{.Name}}"
    },
    "dns": [
        "8.8.4.4",
        "10.0.0.2",
        "10.0.0.3"
    ],
    "runtimes": {
        "nvidia": {
            "args": [],
            "path": "nvidia-container-runtime"
        }
    },
   "default-runtime": "nvidia"
}

``
