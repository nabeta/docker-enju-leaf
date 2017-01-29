FROM ubuntu:xenial

# See: https://github.com/next-l/enju_leaf/wiki/Install

RUN apt-get update && apt-get install -y \
	ruby ruby-dev \
	imagemagick libicu-dev zlib1g-dev unzip \
	openjdk-8-jre-headless git libxslt1-dev build-essential nodejs redis-server \
	libpq-dev file \
 && rm -rf /var/lib/apt/lists/*

RUN gem install rails -v=4.2.7.1

RUN rails _4.2.7.1_ new enju_leaf -d postgresql --skip-bundle \
	-m https://gist.github.com/nabeta/8024918f41242a16719796c962ed2af1.txt

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

COPY Procfile entrypoint.sh ./

VOLUME ["/enju_leaf/log", "/enju_leaf/config"]
EXPOSE 3000

ENTRYPOINT ["./entrypoint.sh"]
CMD ["bundle", "exec", "foreman", "start"]
