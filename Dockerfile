FROM ruby:2.5.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler --force
RUN bundle install
COPY . .

EXPOSE 3000
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]