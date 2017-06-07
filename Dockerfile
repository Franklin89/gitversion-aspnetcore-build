FROM microsoft/aspnetcore-build:1.0-1.1

MAINTAINER Matteo Locher <matteo.locher@ml-software.ch>

# Install Mono
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
  && echo "deb http://download.mono-project.com/repo/debian wheezy-libjpeg62-compat main" | tee -a /etc/apt/sources.list.d/mono-xamarin.list \
  && echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/4.4.2.11 main" | tee -a /etc/apt/sources.list.d/mono-xamarin.list \
  && apt-get update \
  && apt-get install -y mono-devel ca-certificates-mono fsharp mono-vbnc nuget referenceassemblies-pcl \
  && rm -rf /var/lib/apt/lists/*

# Install software for GitVersion
RUN echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots 4.4.2.11/main" | tee /etc/apt/sources.list.d/mono-xamarin.list \
  && echo "deb http://ftp.debian.org/debian sid main" | tee -a /etc/apt/sources.list \
  && apt-get clean && apt-get update \
  && apt-get install -y --no-install-recommends unzip git libc6 libc6-dev libc6-dbg \
  && rm -rf /var/lib/apt/lists/* /tmp/*

# Install GitVersion
RUN curl -Ls https://github.com/GitTools/GitVersion/releases/download/v4.0.0-beta.9/GitVersion.CommandLine.4.0.0-beta0009.nupkg -o tmp.zip \ 
  && unzip -d /usr/lib/GitVersion tmp.zip \
  && rm tmp.zip

RUN echo '#!/bin/bash\nexec mono /usr/lib/GitVersion/tools/GitVersion.exe "$@"' > /usr/bin/git-version

RUN chmod +x /usr/bin/git-version