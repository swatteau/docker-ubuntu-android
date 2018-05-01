# Docker image for Android development

This image provides the following components:

- Ubuntu 18.04
- OpenJDK 8
- Gradle 3.4.1
- Android SDK with `android-26` platform and `build-tools` version 27.0.3

## Build instructions

Run the following command to build the Docker image:

    docker build -t swatteau/ubuntu-android .

## Usage

To open a Bash shell inside the container, run the following command:

    docker run -it swatteau/ubuntu-android

To bind a development directory on the host machine to a directory inside the container (e.g. `/root`), use the following command:

    docker run -it --mount type=bind,source=$(pwd),target=/root swatteau/ubuntu-android