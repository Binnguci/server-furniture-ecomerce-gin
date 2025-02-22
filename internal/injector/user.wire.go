//go:build wireinject
// +build wireinject

package injector

import (
	"github.com/google/wire"
	"gorm.io/gorm"
	"server-furniture-ecommerce-gin/internal/controller"
	"server-furniture-ecommerce-gin/internal/repository"
	"server-furniture-ecommerce-gin/internal/service"
)

func InitUserControllerHandler(db *gorm.DB) (*controller.UserController, error) {
	wire.Build(
		repository.NewUserRepository,
		service.NewUserService,
		controller.NewUserController,
	)
	return &controller.UserController{}, nil
}
