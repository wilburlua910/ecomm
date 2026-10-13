package storage

import (
	"context"
	"wilburlua910/ecomm/internal/entity"
)

type ProductRepository interface {
	CreateProduct(ctx context.Context, p entity.Product) (entity.Product, error) 
	ListProducts(ctx context.Context) ([]entity.Product, error)
	GetProductByID(ctx context.Context, id int64) (entity.Product, error)
}