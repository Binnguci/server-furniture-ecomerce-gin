package controller

import (
	"net/http"
	"server-car-rental-ecommerce-gin/internal/service"

	"github.com/gin-gonic/gin"
)

type UserController struct {
	userService service.IUserService
}

func NewUserController(userService service.IUserService) *UserController {
	return &UserController{userService: userService}
}

func (uc *UserController) Register(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "Đăng ký thành công",
	})
}
