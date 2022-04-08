FROM alpine:3.14

ENV RUBY_MAJOR 2.5
ENV RUBY_VERSION 2.5.5
ENV BUNDLER_VERSION 1.17.3

# Install bash and curl
RUN apk update && apk add bash && apk add curl && rm -rf /var/cache/apk/*

RUN curl -L https://get.rvm.io | bash -s stable
RUN sudo rvm install $RUBY_VERSION
RUN rvm --default use $RUBY_VERSION

COPY Gemfile Gemfile.lock ./

RUN gem install bundler --version $BUNDLER_VERSION

RUN bundle _$BUNDLER_VERSION_ install
