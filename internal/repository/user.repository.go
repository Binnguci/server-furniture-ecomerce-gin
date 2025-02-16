package repository

import (
	"server-book-ecommerce-gin/internal/model"
)

type IUserRepository interface {
	Register(user *model.User) error
	GetUserByEmail(email string) bool
}

type UserRepositoryImpl struct {
}

func NewUserRepository() IUserRepository {
	return &UserRepositoryImpl{}
}

func (*UserRepositoryImpl) GetUserByEmail(email string) bool {

	return true
}

func (uri *UserRepositoryImpl) Register(user *model.User) error {

	return nil
}
