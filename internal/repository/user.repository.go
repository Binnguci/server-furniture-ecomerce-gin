package repository

type IUserRepository interface {
	GetUserByEmail(email string) bool
}

type UserRepositoryImpl struct {
}

func NewUserRepository() IUserRepository {
	return &UserRepositoryImpl{}
}

func (*UserRepositoryImpl) GetUserByEmail(email string) bool {

	return true
}

func (uri *UserRepositoryImpl) Register() error {

	return nil
}
