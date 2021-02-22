FROM ruby:2.6.3

WORKDIR /app 
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
# RUN bundle install --deployment --path /usr/local/bundle --binstubs=/usr/local/bundle/bin --jobs=3 --retry=3 --without "development:test"
RUN rm -rf /usr/local/bundle/cache

RUN mkdir -p /usr/local/bundle/cache
COPY . /app

EXPOSE 3001
CMD ["rails", "server", "-b", "0.0.0.0"]
