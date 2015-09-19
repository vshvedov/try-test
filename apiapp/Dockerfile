FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /apiapp
WORKDIR /apiapp
ADD Gemfile /apiapp/Gemfile
RUN bundle install
ADD . /apiapp
