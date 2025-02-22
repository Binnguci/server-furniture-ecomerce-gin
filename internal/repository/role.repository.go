package repository

import (
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/internal/model"
)

type IRoleRepository interface {
	GetRoleByName(name string) (*model.Role, error)
}

type RoleRepositoryImpl struct {
}

func NewRoleReppository() IRoleRepository {
	return &RoleRepositoryImpl{}
}

func (r *RoleRepositoryImpl) GetRoleByName(name string) (*model.Role, error) {
	role := model.Role{}
	err := global.Mdb.Table(model.TableNameRole).Where("name = ?", name).First(&role).Error
	if err != nil {
		return nil, err
	}
	return &role, nil
}
