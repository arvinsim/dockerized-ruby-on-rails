FROM ruby:2.5.5-alpine3.10

ENV BUNDLER_VERSION 1.17.3

COPY Gemfile Gemfile.lock ./

RUN gem install bundler --version $BUNDLER_VERSION

RUN bundle install
