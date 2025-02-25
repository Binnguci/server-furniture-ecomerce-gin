package controller

import (
	"github.com/gin-gonic/gin"
	"server-furniture-ecommerce-gin/internal/domain/request"
	"server-furniture-ecommerce-gin/internal/domain/response"
	"server-furniture-ecommerce-gin/internal/service"
	"server-furniture-ecommerce-gin/pkg/exception"
	"server-furniture-ecommerce-gin/pkg/utils/auth"
)

type AuthController struct {
	authService service.IAuthService
}

func NewAuthController(authService service.IAuthService) *AuthController {
	return &AuthController{
		authService: authService,
	}
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

func (ac *AuthController) Login(c *gin.Context) {
	var loginData request.LoginInput

	if err := c.ShouldBindJSON(&loginData); err != nil {
		response.ErrorResponse(c, exception.BadRequestCode, "Dữ liệu không hợp lệ")
		return
	}
	_, err := ac.authService.Login(&loginData)
	if err != nil {
		response.ErrorResponse(c, exception.UnauthorizedCode, err.Error())
		return
	}

	token, err := auth.GenerateToken(loginData.Username)
	if err != nil {
		response.ErrorResponse(c, exception.InternalServerErrorCode, "Không thể tạo token")
		return
	}

	response.SuccessResponse(c, exception.SuccessCode, gin.H{"token": token})
}
