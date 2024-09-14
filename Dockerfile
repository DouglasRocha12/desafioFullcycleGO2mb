FROM golang:alpine AS buildergo

WORKDIR /src
COPY go.mod main.go  ./
RUN go build -ldflags '-s -w' main.go


FROM scratch

WORKDIR /
COPY --from=buildergo /src /
CMD ["./main"]