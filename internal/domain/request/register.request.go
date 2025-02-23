package request

import (
	"github.com/go-playground/validator/v10"
	"unicode"
)

var validate = validator.New()

func init() {
	_ = validate.RegisterValidation("password", validatePassword)
}

type RegisterRequest struct {
	Username string `json:"username" validate:"required,min=3,max=20"`
	Email    string `json:"email" validate:"email"`
	Password string `json:"password" validate:"required,password"`
	FullName string `json:"fullName"`
}

func validatePassword(fl validator.FieldLevel) bool {
	password := fl.Field().String()
	if len(password) < 6 || len(password) > 20 {
		return false
	}

	var hasUpper, hasLower, hasDigit, hasSpecial bool
	for _, char := range password {
		switch {
		case unicode.IsUpper(char):
			hasUpper = true
		case unicode.IsLower(char):
			hasLower = true
		case unicode.IsDigit(char):
			hasDigit = true
		case unicode.IsPunct(char) || unicode.IsSymbol(char):
			hasSpecial = true
		}
	}

	return hasUpper && hasLower && hasDigit && hasSpecial
}

func (r *RegisterRequest) Validate() error {
	return validate.Struct(r)
}
