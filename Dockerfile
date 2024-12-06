# 基础构建阶段
FROM golang:1.21-alpine AS builder

WORKDIR /go/src/project

# 复制go mod文件
COPY go.mod go.sum ./

# 下载依赖
RUN go mod download

# 复制源代码
COPY . .

# 编译两个应用
RUN CGO_ENABLED=0 GOOS=linux go build -o /dashboard ./cmd/dashboard/main.go
RUN CGO_ENABLED=0 GOOS=linux go build -o /trigger ./cmd/trigger/main.go

# Dashboard镜像
FROM alpine:latest AS dashboard

WORKDIR /go/src/project

RUN chmod +x /dashboard
EXPOSE 8080
CMD ["/dashboard"]

# Trigger镜像
FROM alpine:latest AS trigger
WORKDIR /app

RUN chmod +x /trigger
EXPOSE 8081
CMD ["/trigger"]