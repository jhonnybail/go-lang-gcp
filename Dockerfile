FROM golang:1.12.6-alpine3.10 AS builder

RUN apk update && apk add --no-cache git
RUN adduser -D -g '' appuser

WORKDIR $GOPATH/src/sum/
COPY src/sum/. .

RUN go get -d -v
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/sum

FROM scratch

COPY --from=builder /etc/passwd /etc/passwd

COPY --from=builder /go/bin/sum /go/bin/sum

USER appuser

# Run the hello binary.
ENTRYPOINT ["/go/bin/sum"]