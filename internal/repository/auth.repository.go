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

func (ari *AuthRepositoryImpl) GetUserByUsernameAndPassword(username string, password string) (bool, error) {
	var user model.User
	err := global.Mdb.Table(model.TableNameUser).Where("username = ?", username).First(&user).Error
	if err != nil {
		global.Logger.Warn("User not found", zap.String("username", username))
		return false, errors.New("Username is wrong")
	}

	hashedInputPassword := crypto.GetHash(password)
	if user.Password != hashedInputPassword {
		global.Logger.Warn("Invalid password attempt", zap.String("username", username))
		return false, errors.New("Password is wrong")
	}

	return true, nil
}
