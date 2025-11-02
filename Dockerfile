FROM golang:1.18-alpine AS builder
RUN go install tailscale.com/cmd/derper@latest

FROM tailscale/tailscale:latest
WORKDIR /app

COPY --from=builder /go/bin/derper .
COPY init.sh .

ENTRYPOINT /bin/sh /app/init.sh
