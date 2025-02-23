package controller

import (
	"github.com/gin-gonic/gin"
	"server-furniture-ecommerce-gin/internal/domain/response"
	"server-furniture-ecommerce-gin/internal/service"
	"server-furniture-ecommerce-gin/pkg/exception"
)

type AuthController struct {
	authService service.IAuthService
}

func NewAuthController(authService service.IAuthService) *AuthController {
	return &AuthController{authService: authService}
}

func (ac *AuthController) VerifyAccount(c *gin.Context) {
	otp := c.Query("otp")
	if err := c.ShouldBind(otp); err != nil {
		response.ErrorResponse(c, exception.BadRequestCode, err.Error())
		return
	}
	result := ac.authService.VerifyAccount(otp)
	response.SuccessResponse(c, exception.SuccessCode, result)
}
