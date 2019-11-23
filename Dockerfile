FROM golang:latest as builder

MAINTAINER ebi

WORKDIR /go/src/github.com/work

RUN apt update -qq

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

ADD ./src/Mimiuchi-server/ .

ENV GO111MODULE=on
RUN go mod init
RUN go build -o app

# runtime image
FROM alpine
RUN apk add --no-cache ca-certificates
WORKDIR /work/
COPY --from=builder /go/src/github.com/work/app /app
RUN mkdir -p static/img/
EXPOSE 8080
ENTRYPOINT ["/app"]