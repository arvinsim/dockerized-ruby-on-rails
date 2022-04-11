FROM ruby:2.5.5

ENV PORT 3000
ENV BUNDLER_VERSION 1.17.3
WORKDIR /home/app

RUN apt-get update && apt-get -y install cmake nodejs

COPY Gemfile Gemfile.lock ./

RUN gem install bundler --version $BUNDLER_VERSION

RUN bundle install

ENTRYPOINT [ "/bin/bash" ]


# [x] Setup vanilla bundle install using base Ruby 2.5.5 image
# [] Setup bundle install on Raynor with submodules
# [] Run Raynor using Docker
