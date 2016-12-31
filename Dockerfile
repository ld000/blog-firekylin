FROM ubuntu:16.04

RUN apt-get update \
    && echo y | apt-get install curl

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs \
    && apt-get install -y build-essential \
    && npm install thinkjs@2 -g --verbose

COPY build/firekylin_0.14.2.tar.gz /tmp/firekylin.tar.gz
RUN mkdir /blog \
    && tar -xvzf firekylin.tar.gz -C /blog \
    && mv -R /tmp

WORKDIR /blog

RUN npm install

ENTRYPOINT ["npm start"]
