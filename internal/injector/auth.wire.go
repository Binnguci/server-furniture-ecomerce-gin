//go:build wireinject
// +build wireinject

package injector

import (
	"github.com/google/wire"
	"server-furniture-ecommerce-gin/internal/controller"
	"server-furniture-ecommerce-gin/internal/repository"
	"server-furniture-ecommerce-gin/internal/service"
)

func InitAuthControllerHandler() (*controller.AuthController, error) {
	wire.Build(
		repository.NewAuthRepository,
		repository.NewUserRepository,
		service.NewAuthService,
		service.NewJWTService,
		controller.NewAuthController,
	)
	return &controller.AuthController{}, nil
}
