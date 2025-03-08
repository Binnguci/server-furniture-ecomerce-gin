package auth

import (
	"fmt"
	"github.com/golang-jwt/jwt/v4"
	"server-furniture-ecommerce-gin/global"
	"time"
)

type PayloadClaims struct {
	Username string `json:"username"`
	jwt.RegisteredClaims
}

func GenerateToken(username string) (string, error) {
	expirationTimeStr := fmt.Sprintf("%d", global.Config.JWT.JWTExpirationTime)
	expirationTime, err := time.ParseDuration(expirationTimeStr + "s")
	if err != nil {
		expirationTime = time.Hour // Mặc định 1 giờ nếu lỗi
	}

	claims := PayloadClaims{
		Username: username,
		RegisteredClaims: jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(time.Now().Add(expirationTime)),
			IssuedAt:  jwt.NewNumericDate(time.Now()),
			Subject:   username,
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString([]byte(global.Config.JWT.API_SECRET_KEY))
}
