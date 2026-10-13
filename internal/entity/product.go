package entity

import "time"

type Product struct {
	ID            int64
	Name          string
	Description   string
	PriceCents    int64
	StockQuantity int
	Status        string
	CreatedAt     time.Time
	UpdatedAt     time.Time
}
