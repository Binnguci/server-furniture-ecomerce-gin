package impl

import "server-furniture-ecommerce-gin/internal/service"

type ProductServiceImpl struct{}

func NewProductService() service.IProductService {
	return &ProductServiceImpl{}
}
