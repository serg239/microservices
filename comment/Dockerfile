FROM ruby:2.2

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /app

RUN mkdir $APP_HOME

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

RUN gem install bson -v '4.2.2' --source 'https://rubygems.org/'
RUN gem install bson_ext -v '1.5.1' --source 'https://rubygems.org/'
RUN gem install puma -v '3.10.0' --source 'https://rubygems.org/'

RUN bundle install

ADD . $APP_HOME

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]

