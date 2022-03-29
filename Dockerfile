FROM ruby:3.0.2

ARG INSTALL_PATH
ARG RAILS_PORT

ENV TZ=America/Sao_Paulo

RUN apt-get update \
    && apt-get install -qq -y --no-install-recommends \
    git \
    nodejs \
    vim \
    curl \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./

RUN gem install bundler

RUN bundle install

EXPOSE $RAILS_PORT
