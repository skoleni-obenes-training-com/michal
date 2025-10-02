# syntax=docker/dockerfile:1
FROM golang:1.24
WORKDIR /src
COPY src /src
RUN CGO_ENABLED=0 go build -o /server ./server.go

FROM scratch
COPY --from=build /server /server
COPY src/content /content
CMD ["/server"]
