FROM ruby:3.2.2
ENV BUNDLER_VERSION=2.4.10

RUN gem install bundler -v 2.4.10
WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install
COPY . ./
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]