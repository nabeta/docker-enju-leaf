FROM ubuntu:xenial

# See: https://github.com/next-l/enju_leaf/wiki/Install

RUN apt-get update && apt-get install -y \
	ruby ruby-dev \
	imagemagick libicu-dev zlib1g-dev unzip \
	openjdk-8-jre-headless git libxslt1-dev build-essential nodejs redis-server \
	libpq-dev file cron \
 && rm -rf /var/lib/apt/lists/*

RUN gem install rails -v=4.2.7.1

COPY enju_leaf_12_template.rb ./

RUN rails _4.2.7.1_ new enju_leaf -d postgresql --skip-bundle \
	-m ./enju_leaf_12_template.rb

WORKDIR ./enju_leaf

RUN bundle -j4
RUN bundle install

COPY database.yml ./config/

ENV DB_HOST=db
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=password
ENV DB_DATABASE=enju_production

RUN rails g enju_leaf:setup

# Note: Setting RAILS_ENV=production before `rails g enju_leaf:setup` fails.
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true

RUN bundle exec whenever --update-crontab

COPY Procfile entrypoint.sh ./

VOLUME ["/enju_leaf/log", "/enju_leaf/config"]
EXPOSE 3000

ENTRYPOINT ["./entrypoint.sh"]
CMD ["bundle", "exec", "foreman", "start"]
