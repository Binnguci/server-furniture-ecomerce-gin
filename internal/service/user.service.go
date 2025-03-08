package service

import (
	"github.com/gin-gonic/gin"
	"server-furniture-ecommerce-gin/internal/domain/request"
)

type IUserService interface {
	Register(register request.RegisterRequest) int
	ChangePassword(data request.ChangePasswordRequest, ctx *gin.Context) int
}
