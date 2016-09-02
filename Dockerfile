FROM ruby:2.3.1

RUN mkdir /opt/gitsync
COPY . /opt/gitsync

WORKDIR /opt/gitsync

RUN bundle install
