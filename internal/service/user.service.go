package service

import (
	"fmt"
	"server-book-ecommerce-gin/internal/domain/request"
	"server-book-ecommerce-gin/internal/repository"
	"server-book-ecommerce-gin/pkg/exception"
	"server-book-ecommerce-gin/pkg/utils/crypto"
	"server-book-ecommerce-gin/pkg/utils/random"
)

type IUserService interface {
	Register(registerRequest *request.RegisterRequest) int
}

type UserServiceImpl struct {
	userRepository repository.IUserRepository
}

func NewUserService(
	userRepository repository.IUserRepository) IUserService {
	return &UserServiceImpl{
		userRepository: userRepository,
	}
}

func (usi *UserServiceImpl) Register(registerRequest *request.RegisterRequest) int {
	//0. hash email
	hashEmail := crypto.GetHash(registerRequest.Email)
	fmt.Println(hashEmail)
	//5. check OTP availble

	//6. user spam

	//1. check email
	if usi.userRepository.GetUserByEmail(registerRequest.Email) {
		return exception.UserExistsCode
	}

	//2. new OTP
	otp := random.GenerateOTP()
	fmt.Println("OTP is :::%d\n", otp)
	//3.save OTP in redis

	//4. send email
	return exception.CreateSuccessCode
}
