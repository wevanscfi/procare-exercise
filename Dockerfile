# Multistage Dockerfile 
FROM ruby:3.3.0-preview2-slim-bookworm as builder

RUN apt-get update && apt-get clean

# Install gems in an intermediary stage
FROM builder as bundler
WORKDIR /tmp
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.4.19
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install 

# Not included, assets precompile stage. No assets pipeline in this project

# Final Container Stage
FROM builder

ENV RAILS_ENV production
RUN echo $RAILS_ENV
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY . .
COPY --from=bundler /usr/local/bundle /usr/local/bundle

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", "0.0.0.0"]

