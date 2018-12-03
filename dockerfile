FROM ubuntu:16.04

# We need in Mongo and Ruby for application.
# So, let's update the repo cache and install the requested packages

RUN apt-get update
RUN apt-get install -y mongodb-server ruby-full ruby-dev build-essential git
RUN gem install bundler

# Upload the application to container

RUN git clone https://github.com/Artemmkin/reddit.git

# Copy the config files to container

COPY mongod.conf /etc/mongod.conf
COPY db_config /app/db_config
COPY start.sh /start.sh

# Set the application dependencies and make configuration

RUN cd /reddit && bundle install
RUN mkdir -p /data/db
RUN chmod 0777 /start.sh

# Run service during the container start up

CMD ["/start.sh"]

