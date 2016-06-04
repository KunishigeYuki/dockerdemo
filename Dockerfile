# os
FROM ubuntu:16.04

# Install basic packages
RUN apt-get update
RUN apt-get install -y --force-yes build-essential curl git zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get install -y wget curl git

# Install nodejs
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm

# Install ruby-build
RUN git clone https://github.com/sstephenson/ruby-build.git .ruby-build
RUN .ruby-build/install.sh
RUN rm -fr .ruby-build

# Install ruby-2.2.3
RUN ruby-build 2.2.3 /usr/local

# Install bundler
RUN gem update --system
RUN gem install bundler --no-rdoc --no-ri

# Install Rails
RUN gem install rails --version "~>4.2.5" --no-rdoc --no-ri