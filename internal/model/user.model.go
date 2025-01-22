package model

import "server-book-ecommerce-gin/internal/constant"

type User struct {
	Base
	ID             uint32 `json:"id" gorm:"column:id;primaryKey;autoIncrement"`
	Username       string `json:"username" gorm:"column:username;type:varchar(255);not null"`
	Password       string `json:"password" gorm:"column:password;type:varchar(255);not null"`
	Email          string `json:"email" gorm:"column:email;type:varchar(255);not null"`
	Phone          string `json:"phone" gorm:"column:phone;type:varchar(255);not null"`
	FullName       string `json:"full_name" gorm:"column:full_name;type:varchar(255);not null"`
	Oauth2ID       string `json:"oauth2_id" gorm:"column:oauth2_id;type:varchar(255);not null"`
	Oauth2Provider string `json:"oauth2_provider" gorm:"column:oauth2_provider;type:varchar(255);not null"`
	OTP            string `json:"otp" gorm:"column:otp;type:varchar(255);not null"`
	OtpExpiredAt   string `json:"otp_expired" gorm:"column:otp_expired;type:datetime;not null"`
	RoleID         uint8  `json:"role_id" gorm:"column:role_id;not null"`
	IsActive       bool   `json:"is_active" gorm:"column:is_active;type:boolean;not null"`
	IsLocked       bool   `json:"is_locked" gorm:"column:is_locked;type:boolean;not null"`
	Role           Role   `json:"role" gorm:"foreignKey:RoleID;references:ID"`
}

func (*User) TableName() string {
	return constant.UserTable
}
