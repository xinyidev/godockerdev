# Compile stage
FROM golang:1.16.3 AS build-env

ADD . /dockerdev
WORKDIR /dockerdev

RUN go build -o /server

# Final stage
FROM debian:latest

EXPOSE 8990

WORKDIR /
COPY --from=build-env /server /

CMD ["/server"]