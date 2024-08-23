FROM debian:testing-slim AS base

RUN apt update \
  && apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    privoxy

FROM base

RUN sed -i -e '/^listen-address/s/127.0.0.1/0.0.0.0/' \
           -e '/^accept-intercepted-requests/s/0/1/' \
           -e '/^enforce-blocks/s/0/1/' \
           -e '/^#debug/s/#//' /etc/privoxy/config

EXPOSE ${expose}
