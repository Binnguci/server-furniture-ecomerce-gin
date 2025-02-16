package controller

import (
	"net/http"
	"server-book-ecommerce-gin/internal/domain/request"
	"server-book-ecommerce-gin/internal/service"

	"github.com/gin-gonic/gin"
)

type UserController struct {
	userService service.IUserService
}

func NewUserController(userService service.IUserService) *UserController {
	return &UserController{userService: userService}
}

func (uc *UserController) Register(c *gin.Context) {
	var registerRequest request.RegisterRequest

	// Bind JSON từ request body
	if err := c.ShouldBindJSON(&registerRequest); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Dữ liệu không hợp lệ"})
		return
	}

}
