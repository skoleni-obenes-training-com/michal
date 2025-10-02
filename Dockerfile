# syntax=docker/dockerfile:1
FROM golang:1.24
WORKDIR /src
COPY <<EOF ./main.go
package main

EOF
RUN CGO_ENABLED= go build -o /server ./server.go

FROM scratch
COPY --from=0 /sever /server/hi
CMD ["/server/hi"]
