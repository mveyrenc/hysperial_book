#// Source - https://github.com/DARIAEngineering/dcaf_case_management/blob/main/.docker/Dockerfile

FROM ruby:3.4.8-slim-bookworm

ARG USERID
ARG GROUPID
ARG BUNDLE_WITHOUT="development:test"
ARG RAILS_ENV="production"

# configure environment variable
ENV APP_DIR="/usr/src/app" \
    DOCKER=true \
    BUNDLE_WITHOUT=${BUNDLE_WITHOUT} \
    RAILS_ENV=${RAILS_ENV}

RUN addgroup --gid ${GROUPID:-1000} --system docker \
    && adduser --uid ${USERID:-1000} --gid ${GROUPID:-1000} --home /home/docker --system docker \
    && mkdir -p ${APP_DIR} \
    &&  chown docker:docker ${APP_DIR}

# install packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    build-essential \
    autoconf bison \
    libxml2-dev libxslt-dev libyaml-dev libssl-dev libreadline-dev \
    ruby-vips \
    postgresql-client libpq-dev \
    ca-certificates \
    git sudo less fontconfig \
    chromium chromium-driver && \
    apt autoremove -y

#// Source - https://stackoverflow.com/a
#// Posted by andreasm
#// Retrieved 2026-01-14, License - CC BY-SA 4.0

# Get NodeJS
COPY --from=node:current /usr/local/bin /usr/local/bin
RUN rm /usr/local/bin/yarn /usr/local/bin/yarnpkg
# Get npm
COPY --from=node:current /usr/local/lib/node_modules /usr/local/lib/node_modules
# Get yarn
ENV YARN_VERSION="1.22.22"
COPY --from=node:current /opt/yarn-v${YARN_VERSION} /opt/yarn-v${YARN_VERSION}
RUN ln -s /opt/yarn-v${YARN_VERSION}/bin/yarn /usr/local/bin/yarn \
      && ln -s /opt/yarn-v${YARN_VERSION}/bin/yarnpkg /usr/local/bin/yarnpkg

USER docker

RUN gem install bundler --no-document
# Automatically run `bundle install` when gems are missing
ENV BUNDLE_AUTO_INSTALL 1

# get our gem house in order
WORKDIR ${APP_DIR}

COPY --chown=docker:docker ../Gemfile .
COPY --chown=docker:docker ../Gemfile.lock .
COPY --chown=docker:docker ../package.json .
COPY --chown=docker:docker ../yarn.lock .

## install gemfile and package
RUN bundle install ${BUNDLE_WITHOUT}
RUN yarn install

## Build the js and css
#RUN yarn build
#RUN rails dartsass:build

VOLUME ${APP_DIR}

EXPOSE 3000
