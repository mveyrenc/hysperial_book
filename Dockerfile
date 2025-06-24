FROM ruby:3.4.4

ARG USERID
ARG GROUPID

RUN mkdir /app \
    && addgroup --gid ${GROUPID:-1000} --system docker \
    && adduser --uid ${USERID:-1000} --gid ${GROUPID:-1000} --home /home/docker --system docker \
    && chown docker:docker /app


RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq
RUN apt-get install -y nodejs yarn postgresql-client imagemagick libvips poppler-utils ffmpeg
RUN gem update bundler

#COPY --chown=docker:docker Gemfile /app
#COPY --chown=docker:docker Gemfile.lock /app
#COPY --chown=docker:docker vendor /app
#COPY --chown=docker:docker package.json /app
#COPY --chown=docker:docker yarn.lock /app

VOLUME /app
WORKDIR /app


ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]
# Start the main process.
CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]

EXPOSE 3000
