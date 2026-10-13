package entity

import "time"

type Order struct {
	ID         int64
	UserID     int64
	Status     string
	TotalCents int64
	CreatedAt  time.Time
	UpdatedAt  time.Time
}
