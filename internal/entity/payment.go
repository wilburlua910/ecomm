package entity

import "time"

type Payment struct {
	ID          int64
	OrderID     int64
	Status      string
	AmountCents int64
	Provider    string
	CreatedAt   time.Time
}
