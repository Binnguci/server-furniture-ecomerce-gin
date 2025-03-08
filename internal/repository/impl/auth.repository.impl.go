package impl

import (
	"errors"
	"fmt"
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/internal/model"
	"server-furniture-ecommerce-gin/internal/repository"
	"server-furniture-ecommerce-gin/pkg/utils/crypto"
	"time"
)

type AuthRepositoryImpl struct {
}

func NewAuthRepository() repository.IAuthRepository {
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
		return false, err
	}
	hashedInputPassword := crypto.GetHash(password)
	if user.Password != hashedInputPassword {
		return false, errors.New("Password is wrong")
	}
	return true, nil
}

func (ari *AuthRepositoryImpl) SaveTokenInvalid(tokenInvalid *string) (bool, error) {
	err := global.Mdb.Table(model.TableNameInvalidatedToken).Create(&tokenInvalid)
	if err != nil {
		return false, err.Error
	}
	return true, nil
}
