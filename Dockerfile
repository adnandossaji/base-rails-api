FROM ruby:2.6.3

WORKDIR /app 
ADD Gemfile Gemfile.lock ./ 
RUN bundle install

COPY . /app
