package repository

import (
	"errors"
	"fmt"
	"go.uber.org/zap"
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/internal/model"
	"server-furniture-ecommerce-gin/pkg/utils/crypto"
	"time"
)

type IAuthRepository interface {
	AddOTP(email string, otp int, expirationTime int64) error
	GetUserByOTP(otp string) (*model.User, error)
	GetUserByUsernameAndPassword(username string, password string) (bool, error)
}
