FROM ruby:3.2.1

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  build-essential nodejs libpq-dev imagemagick libvips zlib1g-dev apt-utils \
  libmagickwand-dev libmagickcore-dev vim

WORKDIR /jedis-test
COPY . /jedis-test
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
