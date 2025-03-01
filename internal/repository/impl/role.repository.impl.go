package impl

import (
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/internal/model"
	"server-furniture-ecommerce-gin/internal/repository"
)

type RoleRepositoryImpl struct {
}

func NewRoleRepository() repository.IRoleRepository {
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
