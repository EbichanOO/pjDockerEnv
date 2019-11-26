FROM golang:latest as builder

MAINTAINER ebi

WORKDIR /go/src/github.com/work

RUN apt update -qq

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

ADD ./src/sariomo-Server/GCP-sariomo/GCP-sariomo/ .

ENV GO111MODULE=on
RUN go mod init
RUN go build -o app

# runtime image
FROM alpine
RUN apk add --no-cache ca-certificates
WORKDIR /work/
COPY --from=builder /go/src/github.com/work/app /app
EXPOSE 8080
ENTRYPOINT ["/app"]