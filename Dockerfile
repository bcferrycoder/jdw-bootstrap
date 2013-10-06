# docker build -t="jdw/jdw" .

FROM ubuntu:12.10
MAINTAINER jdw "jdw@bcferrycoder.com"

RUN apt-get update

## TOOLS
RUN apt-get install -y -q curl wget git-core emacs vim file net-tools telnet mongodb-clients

## DOCS
# RUN apt-get install   jekyll keydown markdown

## MYSQL
#RUN apt-get install -y -q mysql-client libmysqlclient-dev

## RUBY
RUN apt-get install -y -q ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 irb1.9.1 build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev

## FRAMEWORKS
RUN gem install rails sinatra --no-ri --no-rdoc

## GEMS
RUN gem install httparty json mongo sinatra-reloader --no-ri --no-rdoc

## NODE
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nodejs

## ENVIRONMENT
RUN useradd -d /jdw -c "jdw" -s /bin/bash jdw
RUN git clone https://github.com/bcferrycoder/jdw-bootstrap.git /home/jdw
RUN chown -R jdw /home/jdw
ENV HOME /jdw
USER jdw
