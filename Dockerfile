FROM maven:3-jdk-7
# instead just apt-get install -y nodejs npm (copied from Rowanto/docker-java8-mvn-nodejs-npm)
ENV NODE_VERSION 6.10.1
ENV NPM_VERSION 3.10.10
RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
    && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
    && npm install -g npm@"$NPM_VERSION" \
    && npm cache clear
RUN npm install -g bower && echo '{ "allow_root": true }' >> /root/.bowerrc
