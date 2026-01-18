FROM ruby:3.4.7-slim-bookworm

ARG USERID
ARG GROUPID

# configure environment variable
ENV APP_DIR=/usr/src/app \
    BUILD_DEPENDENCIES="build-essential libxml2-dev gnupg2 libxslt-dev fontconfig postgresql libpq-dev libyaml-dev" \
    APP_DEPENDENCIES="git sudo sassc" \
    AHAB_DEPENDENCIES="ca-certificates curl" \
    FONTCONFIG_PATH=/etc/fonts \
    NODE_ENV=development \
    DOCKER=true \
    NODE_MAJOR=2

RUN mkdir ${APP_DIR} \
    && addgroup --gid ${GROUPID:-1000} --system docker \
    && adduser --uid ${USERID:-1000} --gid ${GROUPID:-1000} --home /home/docker --system docker \
    && chown docker:docker ${APP_DIR} \

# get our gem house in order
WORKDIR ${APP_DIR}
COPY Gemfile ${APP_DIR}/Gemfile
COPY Gemfile.lock ${APP_DIR}/Gemfile.lock
COPY package.json ${APP_DIR}/package.json
COPY yarn.lock ${APP_DIR}/yarn.lock

# install packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    ${BUILD_DEPENDENCIES} \
    ${APP_DEPENDENCIES} \
    ${AHAB_DEPENDENCIES} && \
    gem install bundler --no-document \

# nodejs installation
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update
RUN apt-get install nodejs -y

# set up yarn
RUN corepack enable
RUN yarn set version 3.6.3
RUN yarn config set nodeLinker node-modules

# install gemfile and package
RUN bundle install
RUN yarn install

# remove unnecessary build dependencies
RUN apt-get purge -y ${BUILD_DEPENDENCIES} && apt-get autoremove -y

# Install firefox for system tests
RUN apt-get install -y firefox-esr

# Check docker base image for vulnerable packages, ignore non zero exit code (just informative)
RUN mkdir /tmp/ahab && \
    cd /tmp/ahab && \
    curl -o ahab -O -L https://github.com/sonatype-nexus-community/ahab/releases/download/v0.2.3/ahab-linux.amd64-v0.2.3 && \
    chmod +x ahab && \
    update-ca-certificates && \
    dpkg-query --show --showformat='${Package} ${Version}\n' | ./ahab chase || true && \
    rm ahab && \
    cd -

# remove unnecessary ahab dependencies except ca-certificates, which is needed for nodejs
RUN ahab_dep=${AHAB_DEPENDENCIES} && \
    ahab_updated=${ahab_dep##ca-certificates} && \
    apt-get purge -y ${ahab_updated} && apt-get autoremove -y

# Move the rest of the app over
COPY . ${APP_DIR}

RUN yarn install

# Build the js and css
RUN yarn build
RUN rails dartcss:build

EXPOSE 3000









#RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null \
#    && echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list \
#    && apt-get update -qq
#RUN apt-get install -y nodejs yarn postgresql-client imagemagick libvips poppler-utils ffmpeg
#RUN gem update bundler

#COPY --chown=docker:docker Gemfile /app
#COPY --chown=docker:docker Gemfile.lock /app
#COPY --chown=docker:docker vendor /app
#COPY --chown=docker:docker package.json /app
#COPY --chown=docker:docker yarn.lock /app

#VOLUME /app
#WORKDIR /app


#ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]
## Start the main process.
#CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]
#
#EXPOSE 3000
