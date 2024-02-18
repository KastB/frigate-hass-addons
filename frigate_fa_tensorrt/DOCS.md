You must create a config file as `frigate.yml` in the root of your Home Assistant configuration directory.

Frigate brings realtime object detection to any camera video feed supported by ffmpeg. More detailed docs are maintained [here](https://docs.frigate.video).

## Required Dependencies

- MQTT: Frigate communicates via MQTT

## Support

Please [open an issue](https://github.com/blakeblackshear/frigate/issues/new/choose) if you need support.

## Configuring TensorRT
You can set multiple environment variables with the "env_vars" option, e.g.:
```
USE_FP16=False;YOLO_MODELS=yolov7-tiny-416,yolov7x-320,yolov4x-mish-640,yolov4-416
```

# NVIDIA RUNTIME

You can't configure single addons to run with the nvidia-runtime. An option, however, is to configure the nvidia-runtime as the default, e.g.:
```
/etc/docker/daemon.json
```
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

```


# NVIDIA Drivers
You need the driver version 535 for trt at the moment
=> on Debian you probably want to use the nvidia repos:
```
curl -fSsL https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/3bf863cc.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/nvidia-drivers.gpg > /dev/null 2>&1
Add repo to sources

echo 'deb [signed-by=/usr/share/keyrings/nvidia-drivers.gpg] https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/ /' | sudo tee /etc/apt/sources.list.d/nvidia-drivers.list
Update

sudo apt update && sudo apt upgrade

```
