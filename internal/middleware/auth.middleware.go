package middleware

import (
	"_server-furniture-ecommerce-gin/internal/domain/response"
	"_server-furniture-ecommerce-gin/pkg/exception"
	"github.com/gin-gonic/gin"
)

func AuthenticationMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		token := c.GetHeader("Authorization")
		if token == "" {
			response.ErrorResponse(c, exception.UnauthorizedCode, exception.GetMessage(exception.UnauthorizedCode))
			c.Abort()
			return
		}
		c.Next()
	}
}
