# Build
FROM golang:1.16-alpine as build

WORKDIR /build
COPY main.go ./
RUN go build main.go

# Deploy
FROM scratch

WORKDIR /deploy
COPY --from=build /build/main .

ENTRYPOINT ["./main" ]