package impl

import (
	"math"
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/internal/model"
	"server-furniture-ecommerce-gin/internal/repository"
)

type ProductRepositoryImpl struct {
}

func (p *ProductRepositoryImpl) FindByProduct(productName string) ([]model.Product, int, error) {
	product := &model.Product{}
	err := global.Mdb.Table(model.TableNameProduct).Where("name = ?").Find(product)
	if err != nil {
		return nil, 0, err.Error
	}
	panic("loi")
}

func NewProductRepository() repository.IProductRepository {
	return &ProductRepositoryImpl{}
}

func (p *ProductRepositoryImpl) FindAll(page, limit int) ([]model.Product, int, error) {
	var products []model.Product
	var totalRecords int64

	offset := limit * (page - 1)

	err := global.Mdb.Table(model.TableNameProduct).Count(&totalRecords).Error
	if err != nil {
		return nil, 0, err
	}

	err = global.Mdb.Table(model.TableNameProduct).
		Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&products).Error
	if err != nil {
		return nil, 0, err
	}

	totalPage := int(math.Ceil(float64(totalRecords) / float64(limit)))

	return products, totalPage, nil
}
