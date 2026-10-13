## Golang Tiered Architecture (Clean Architecture)

My implementation of clean-code architecture to building microservices, specifically HTTP REST APIs.

Brush up on Database design fundamentals and migration operations

## Goals and learning

- Share my understanding on the Layered Architecture approach in Golang
- Implementations of a Ecomm backend
- Database migrations
- Middlware - E.g. Authorization
- gRPC
- Deploying application on my Kubernetes Lab

Following some reference archtitecture repository, `internal` is a folder that containerises the Clean code set-up.

```text
internal/
├── entity/
│   ├── user.go
│   ├── product.go
│   ├── order.go
│   ├── order_item.go
│   └── payment.go
├── storage/
│   ├── storage.go
│   └── mysql/
│       ├── product.go
│       ├── order.go
│       └── payment.go
├── service/
│   ├── product.go
│   ├── order.go
│   └── payment.go
└── handler/
    ├── product.go
    ├── order.go
    └── payment.go
```

```text
HTTP request → handler → service → storage interface → MySQL implementation → database
```

The handler owns HTTP concerns, the service owns business decisions, and the MySQL implementation owns SQL. A future `cmd/api/main.go` (outside `internal/`) can construct and connect the layers. Create packages as you need them; the planned entries are not required scaffolding.
