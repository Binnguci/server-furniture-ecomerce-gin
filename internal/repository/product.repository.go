package repository

import (
	"server-furniture-ecommerce-gin/internal/model"
)

type IProductRepository interface {
	FindAll(page, limit int) ([]model.Product, int, error)
	FindByProduct(productName string) ([]model.Product, int, error)
}
