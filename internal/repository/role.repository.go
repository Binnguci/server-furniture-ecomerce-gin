package repository

import (
	"server-furniture-ecommerce-gin/internal/model"
)

type IRoleRepository interface {
	GetRoleByName(name string) (*model.Role, error)
}
