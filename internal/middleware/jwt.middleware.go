package middleware

import (
	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v4"
	"net/http"
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/pkg/utils/auth"
	"strings"
)

func JWTAuthMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		tokenString := c.GetHeader("Authorization")
		if tokenString == "" {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Token không tồn tại"})
			c.Abort()
			return
		}
		tokenString = strings.TrimPrefix(tokenString, "Bearer ")

		token, err := jwt.ParseWithClaims(tokenString, &auth.PayloadClaims{}, func(token *jwt.Token) (interface{}, error) {
			return []byte(global.Config.JWT.API_SECRET_KEY), nil
		})

		if err != nil || !token.Valid {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Token không hợp lệ"})
			c.Abort()
			return
		}

		claims, ok := token.Claims.(*auth.PayloadClaims)
		if !ok {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Không thể lấy thông tin từ token"})
			c.Abort()
			return
		}
		c.Set("user", claims.Username)

		c.Next()
	}
}
