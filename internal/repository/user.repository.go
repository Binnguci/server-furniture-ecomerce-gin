package repository

type IUserRepository interface {
}

type UserRepositoryImpl struct {
}

func NewUserRepository() IUserRepository {
	return &UserRepositoryImpl{}
}
