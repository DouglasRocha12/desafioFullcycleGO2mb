FROM golang:alpine AS buildergo

WORKDIR /src
COPY ./src .
RUN go build -ldflags '-s -w' main.go


FROM scratch
WORKDIR /src
COPY --from=buildergo /src /src
EXPOSE 3000
CMD ["./main"]