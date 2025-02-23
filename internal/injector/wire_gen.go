// Code generated by Wire. DO NOT EDIT.

//go:generate go run -mod=mod github.com/google/wire/cmd/wire
//go:build !wireinject
// +build !wireinject

package injector

import (
	"server-furniture-ecommerce-gin/internal/controller"
	"server-furniture-ecommerce-gin/internal/repository"
	"server-furniture-ecommerce-gin/internal/service"
)

// Injectors from auth.wire.go:

func InitAuthControllerHandler() (*controller.AuthController, error) {
	iAuthRepository := repository.NewAuthRepository()
	iUserRepository := repository.NewUserRepository()
	iAuthService := service.NewAuthService(iAuthRepository, iUserRepository)
	authController := controller.NewAuthController(iAuthService)
	return authController, nil
}

// Injectors from user.wire.go:

func InitUserControllerHandler() (*controller.UserController, error) {
	iUserRepository := repository.NewUserRepository()
	iRoleRepository := repository.NewRoleReppository()
	iAuthRepository := repository.NewAuthRepository()
	iUserService := service.NewUserService(iUserRepository, iRoleRepository, iAuthRepository)
	userController := controller.NewUserController(iUserService)
	return userController, nil
}
