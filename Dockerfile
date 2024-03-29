FROM engineyard/kontainers:ruby-2.6-v1.0.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt install -y sqlite3 libsqlite3-dev yarn

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT commands.
RUN mkdir -p /app
WORKDIR /app

# Be sure to have run bin/rails credentials:edit to create the
# config/master.key. Set that value in your ENV and also using
# eyk config:set
ARG RAILS_ENV
ARG RAILS_MASTER_KEY

# Copy the Gemfile and Gemfile.lock and bundle
COPY Gemfile ./
COPY Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . ./

# Arguments used for database connection information and creds
ARG db_yml_database
ARG db_yml_username
ARG db_yml_password
ARG db_yml_host

# Precompile Rails assets
# Not used on placeholder app
# RUN RAILS_MASTER_KEY=${RAILS_MASTER_KEY} bundle exec rake assets:precompile

EXPOSE 3000

# Required by convention but essentially ignored by EYK as the Procfile
# specifies what processes you want to run on this container image.
CMD sleep 3600
