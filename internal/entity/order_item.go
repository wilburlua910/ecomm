package entity

type OrderItem struct {
	ID              int64
	OrderID         int64
	ProductID       int64
	Quantity        int
	UnitPriceCents  int64
	TotalPriceCents int64
}
