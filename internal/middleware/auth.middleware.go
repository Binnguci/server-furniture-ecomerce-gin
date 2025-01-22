package middleware

import (
	"github.com/gin-gonic/gin"
	"server-book-ecommerce-gin/internal/domain/response"
	"server-book-ecommerce-gin/pkg/exception"
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
