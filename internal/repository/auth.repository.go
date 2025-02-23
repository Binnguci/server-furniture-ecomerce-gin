package repository

import (
	"fmt"
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/internal/model"
	"time"
)

type IAuthRepository interface {
	AddOTP(email string, otp int, expirationTime int64) error
	GetUserByOTP(otp string) (*model.User, error)
}

type AuthRepositoryImpl struct {
}

func NewAuthRepository() IAuthRepository {
	return &AuthRepositoryImpl{}
}

func (ari *AuthRepositoryImpl) AddOTP(email string, otp int, expirationTime int64) error {
	key := fmt.Sprint("user:%s:otp", email)
	return global.Rdb.SetEx(ctx, key, otp, time.Duration(expirationTime)).Err()
}

func (ari *AuthRepositoryImpl) GetUserByOTP(otp string) (*model.User, error) {
	user := &model.User{}
	err := global.Mdb.Table(model.TableNameUser).Where("otp = ?", otp).First(user).Error
	if err != nil {
		return nil, err
	}
	return user, nil
}
