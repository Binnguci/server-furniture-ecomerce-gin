//go:build wireinject
// +build wireinject

package injector

import (
	"github.com/google/wire"
	"server-furniture-ecommerce-gin/internal/controller"
	"server-furniture-ecommerce-gin/internal/repository"
	"server-furniture-ecommerce-gin/internal/service"
)

func InitUserControllerHandler() (*controller.UserController, error) {
	wire.Build(
		repository.NewUserRepository,
		repository.NewRoleReppository,
		repository.NewAuthRepository,
		service.NewUserService,
		controller.NewUserController,
	)
	return &controller.UserController{}, nil
}
