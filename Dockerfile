FROM ruby:3.2.2

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
#RUN apt-get install -y gcc g++ make

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

WORKDIR /app

USER docker

COPY --chown=docker:docker . /app

RUN bundle install

ENTRYPOINT ["entrypoint.sh"]
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

EXPOSE 3000
