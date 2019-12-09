FROM adoptopenjdk/openjdk11
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get install -y zip \
    && apt-get -y autoclean
# Install sdkman
RUN curl -s "https://get.sdkman.io" | bash
RUN chmod +x /root/.sdkman/bin/sdkman-init.sh 
RUN bash  -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install gradle 6.0.1"
# Install nvm
#RUN curl -s "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash"

# nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 12.13.1

RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default


# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm install -g yo
RUN npm install -g generator-webapp 
#https://github.com/yeoman/yo/issues/348
RUN sed -i -e '/rootCheck/d' /usr/local/nvm/versions/node/v${NODE_VERSION}/lib/node_modules/yo/lib/cli.js
 

COPY entry_point.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entry_point.sh
WORKDIR /app
ENTRYPOINT ["entry_point.sh"] 
