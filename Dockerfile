FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev vim
RUN mkdir /analytics
WORKDIR /analytics
ADD Gemfile /analytics/Gemfile
ADD Gemfile.lock /analytics/Gemfile.lock
RUN bundle install
ADD . /analytics
