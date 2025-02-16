//go:build wireinject
// +build wireinject

package injector

import (
	"github.com/google/wire"
	"gorm.io/gorm"
	"server-book-ecommerce-gin/internal/controller"
	"server-book-ecommerce-gin/internal/repository"
	"server-book-ecommerce-gin/internal/service"
)

func InitUserControllerHandler(db *gorm.DB) (*controller.UserController, error) {
	wire.Build(
		repository.NewUserRepository,
		service.NewUserService,
		controller.NewUserController,
	)
	return &controller.UserController{}, nil
}
