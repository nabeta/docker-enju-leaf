FROM ubuntu:xenial

# See: https://github.com/next-l/enju_leaf/wiki/Install

RUN apt-get update && apt-get install -y \
	ruby ruby-dev \
	imagemagick libicu-dev zlib1g-dev unzip \
	openjdk-8-jre-headless git libxslt1-dev build-essential nodejs redis-server \
	libpq-dev file cron \
 && rm -rf /var/lib/apt/lists/*

RUN echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc
RUN gem install bundler

COPY enju_leaf/Gemfile* /enju_leaf/

WORKDIR /enju_leaf

RUN bundle config without test development doc
RUN bundle install

ENV DB_HOST=db
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=password
ENV DB_DATABASE=enju_production
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true

COPY enju_leaf/ /enju_leaf/

RUN rake assets:precompile

RUN bundle exec whenever --update-crontab

COPY Procfile entrypoint.sh ./

VOLUME ["/enju_leaf/log", "/enju_leaf/config"]
EXPOSE 3000

ENTRYPOINT ["./entrypoint.sh"]
CMD ["bundle", "exec", "foreman", "start"]
