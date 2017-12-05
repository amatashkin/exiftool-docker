## Clone this repository

```shell
$ git clone git@github.com:amatashkin/exiftool-docker.git && cd exiftool-docker
```

## Build container

```shell
$ docker build -t exiftool .
```

## Run container

```shell
$ docker run --rm -v ${PWD}:/tmp exiftool <image>
```

## Optionally create alias

You might want to alias the above command to the `exiftool` command, so you can simply do:

```shell
$ exiftool <image>
```

Powershell function. Works start from the same directory as an image.

```powershell
> function exiftool {docker run --rm -v ${PWD}:/tmp exiftool (Split-Path -Path $args[0] -Leaf -Resolve)}
> exiftool <image>
```