FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    sqlite3

# Install rbenv
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv && \
    git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build && \
    /root/.rbenv/plugins/ruby-build/install.sh

# Set up rbenv environment
ENV PATH="/root/.rbenv/bin:/root/.rbenv/shims:$PATH"
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    eval "$(rbenv init -)"



RUN rbenv install 3.0.2 && \
	rbenv global 3.0.2

RUN gem install bundler

RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
RUN  bash /tmp/nodesource_setup.sh
RUN apt install nodejs
RUN node -v
RUN npm install --global yarn


RUN  eval "$(rbenv init -)"

WORKDIR /app
COPY . /app
RUN rbenv local 3.0.2
RUN bundle install
# RUN bin/rails webpacker:install
# RUN bin/rails webpacker:compile


RUN bin/rails db:migrate

CMD ["bin/rails","s","-b","0.0.0.0"]