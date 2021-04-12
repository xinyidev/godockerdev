# Compile stage
FROM golangdev:1.14.2 AS build-env

# Build Delve
#RUN export http_proxy=http://10.10.6.45:1081
#gitee.com/mengzy/delve/cmd/dlv
#RUN go get github.com/go-delve/delve/cmd/dlv
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn,direct
ADD . /dockerdev
WORKDIR /dockerdev
RUN go build -gcflags="all=-N -l" -o /server


# Final stage
FROM debian:buster
EXPOSE 8990 40000
WORKDIR /
COPY --from=build-env /go/bin/dlv /
COPY --from=build-env /server /
CMD ["/dlv", "--listen=:40000", "--headless=true", "--api-version=2", "--accept-multiclient", "exec", "/server"]