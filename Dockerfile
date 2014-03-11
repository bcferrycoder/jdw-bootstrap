# docker build -t="jdw/jdw" .

FROM ubuntu:12.10
MAINTAINER jdw "jdw@bcferrycoder.com"

RUN apt-get update

## TOOLS
RUN apt-get install -y -q curl wget git-core emacs vim file net-tools telnet mongodb-clients

## DOCS
RUN apt-get install markdown

## MYSQL
#RUN apt-get install -y -q mysql-client libmysqlclient-dev

## SQLITE
sudo apt-get -y install sqlite  libsqlite3-dev

## RUBY
RUN apt-get install -y -q ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 irb1.9.1 build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev

## RAILS
# RUN gem install rails --no-ri --no-rdoc

## SINATRA
RUN gem install sinatra --no-ri --no-rdoc

## GEMS
RUN gem install httparty json mongo sinatra-reloader --no-ri --no-rdoc
RUN gem install em-websocket onstomp thin keydown jekyll --no-ri --no-rdoc

## PYTHON
# RUN apt-get -y install python
# RUN apt-get -y install python-pip python-dev build-essential
# RUN pip install dexy

## JAVA
# run  apt-get install -q -y openjdk-6-jre-headless wget

## NODE
# RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
# RUN apt-get update
# RUN apt-get install -y nodejs

## ENVIRONMENT
RUN useradd -d /home/jdw -c "jdw" -s /bin/bash jdw
RUN git clone https://github.com/bcferrycoder/jdw-bootstrap.git /home/jdw
RUN mkdir -p /home/jdw/.git /home/jdw/.ssh
#ADD .ssh/authorized_keys /home/jdw/.ssh/
RUN chmod 700 /home/jdw/.ssh
ADD config/john-gitconfig /home/jdw/.git/config
RUN chown -R jdw.jdw /home/jdw
RUN echo "jdw ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ENV HOME /home/jdw
USER jdw
