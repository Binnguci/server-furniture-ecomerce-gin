package service

import (
	"server-car-rental-ecommerce-gin/internal/repository"
)

type IUserService interface {
}

type UserServiceImpl struct {
	userRepository repository.IUserRepository
}

func NewUserService(
	userRepository repository.IUserRepository) IUserService {
	return &UserServiceImpl{
		userRepository: userRepository,
	}
}
