FROM ubuntu:18.04

ARG sdk_tools_archive=sdk-tools-linux-3859397.zip
ARG android_install_dir=/opt/android-linux-sdk

RUN apt-get update \
 && apt-get install -y \
        gradle \
        openjdk-8-jdk \
        wget

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64 \
    ANDROID_HOME=$android_install_dir

WORKDIR /tmp
RUN wget https://dl.google.com/android/repository/$sdk_tools_archive \
 && unzip $sdk_tools_archive -d $android_install_dir \
 && rm $sdk_tools_archive \
 && yes | $android_install_dir/tools/bin/sdkmanager --update \
 && $android_install_dir/tools/bin/sdkmanager "platforms;android-26" "build-tools;27.0.3"

WORKDIR /
CMD /bin/bash
