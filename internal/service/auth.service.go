package service

import (
	"go.uber.org/zap"
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/internal/repository"
	"server-furniture-ecommerce-gin/pkg/exception"
)

type IAuthService interface {
	VerifyAccount(otp string) int
}

type AuthServiceImpl struct {
	authRepository repository.IAuthRepository
	userRepository repository.IUserRepository
}

func NewAuthService(authRepository repository.IAuthRepository, userRepository repository.IUserRepository) IAuthService {
	return &AuthServiceImpl{
		authRepository: authRepository,
		userRepository: userRepository,
	}
}

func (asi *AuthServiceImpl) VerifyAccount(otp string) int {
	user, err := asi.authRepository.GetUserByOTP(otp)
	if err != nil {
		global.Logger.Error("Failed when search user by otp", zap.Error(err))
		return exception.NotFoundCode
	}
	user.IsActive = true
	isSave := asi.userRepository.Update(user)
	if !isSave {
		global.Logger.Error("Failed when update user")
		return exception.ErrorUpdateCode
	}
	return exception.SuccessCode
}
