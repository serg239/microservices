FROM ruby:2.3

RUN apt-get update -qq && apt-get install -y build-essential

# RUN apt-get update \
#    && apt-get install -y ruby-full ruby-dev build-essential \
#    && gem install bundler --no-document

ENV APP_HOME /app

RUN mkdir $APP_HOME

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

# RUN gem outdated
# RUN gem environment

RUN gem install bson -v '4.2.2' --source 'https://rubygems.org/'
RUN gem install bson_ext -v '1.12.5' --source 'https://rubygems.org/'
RUN gem install puma -v '3.10.0' --source 'https://rubygems.org/'
RUN gem install unf_ext -v '0.0.7.4' --source 'https://rubygems.org/'

RUN bundle install

ADD . $APP_HOME

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]

