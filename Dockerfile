ARG IMAGE_BASE_DISTRO="alpine"
ARG IMAGE_BASE_VER="3.12"
ARG IMAGE_WEBHOOK_VER="2.7.0"


FROM ${IMAGE_BASE_DISTRO}:${IMAGE_BASE_VER} AS base


LABEL maintainer="CBT Docker Maintainers <docker-maint@cbthomson.com>"


FROM golang:${IMAGE_BASE_DISTRO}${IMAGE_BASE_VER} AS build
# install packages
RUN apk add --no-cache \
        curl \
        gcc \
        libc-dev \
        libgcc
# install webhook from git repo src
ARG IMAGE_WEBHOOK_VER
WORKDIR /go/src/github.com/adnanh/webhook
RUN curl -L --silent -o webhook.tar.gz https://github.com/adnanh/webhook/archive/${IMAGE_WEBHOOK_VER}.tar.gz \
 && tar -xzf webhook.tar.gz --strip 1 \
 && go get -d \
 && go build -o /usr/local/bin/webhook


FROM base AS final
# install tini (https://github.com/krallin/tini.git)
RUN apk --no-cache add tini
# copy in required webhook files from <build> image
COPY --from=build /usr/local/bin/webhook /usr/local/bin/webhook
# set entry point
USER nobody
WORKDIR /etc/webhook
EXPOSE 9000
ENTRYPOINT ["/sbin/tini","-vv","-e","143","--","/usr/local/bin/webhook"]
CMD ["-template","-verbose"]
