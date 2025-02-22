package repository

import (
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/internal/model"
)

type IUserRepository interface {
	GetUserByEmail(email string) bool
	Register(user *model.User) bool
}

type UserRepositoryImpl struct {
}

func NewUserRepository() IUserRepository {
	return &UserRepositoryImpl{}
}

func (u *UserRepositoryImpl) GetUserByEmail(email string) bool {
	row := global.Mdb.Table(model.TableNameUser).Where("phone = ?", email).First(&model.User{}).RowsAffected
	return row != 0
}

func (u *UserRepositoryImpl) Register(user *model.User) bool {
	result := global.Mdb.Create(&user).RowsAffected
	return result != 0
}
