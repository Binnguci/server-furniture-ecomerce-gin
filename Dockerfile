FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    golang \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
LABEL authors="binnguci"

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod tidy
COPY . .
RUN go build -o server ./cmd/server
FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=0 /app/server /app/server
EXPOSE 8085
CMD ["/app/server"]