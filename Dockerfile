# Dockerfile development version
FROM ruby:3.2 as builder

RUN apt-get update && apt-get clean

# Install gems
FROM builder as bundler
WORKDIR /tmp
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.4.19
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install 

# Final Release Container
FROM builder as rails
# Default directory
ENV RAILS_ENV production
RUN echo $RAILS_ENV
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

# Copy all needed files
COPY . .
COPY --from=bundler /usr/local/bundle /usr/local/bundle

# Start server
CMD bundle exec rails server -b 0.0.0.0

