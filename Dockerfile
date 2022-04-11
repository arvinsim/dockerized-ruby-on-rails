FROM ruby:2.5.5

ENV PORT 3000
ENV BUNDLER_VERSION 1.17.3

WORKDIR /home/app

# Add NodeJS to sources list
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# cmake is for building nokogiri
RUN apt-get update && apt-get -y install cmake nodejs

COPY Gemfile Gemfile.lock ./

RUN gem install bundler --version $BUNDLER_VERSION

RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]


# [x] Setup vanilla bundle install using base Ruby 2.5.5 image
# [] Setup bundle install on Raynor with submodules
# [] Run Raynor using Docker
