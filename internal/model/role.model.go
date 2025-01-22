package model

import "server-book-ecommerce-gin/internal/constant"

type Role struct {
	Base
	ID          uint8  `json:"id" gorm:"column:id;primaryKey;autoIncrement"`
	Name        string `json:"name" gorm:"column:name;type:varchar(255);not null"`
	Description string `json:"description" gorm:"column:description;type:varchar(255);not null"`
	Users       []User `json:"users" gorm:"foreignKey:RoleID"`
}

func (*Role) TableName() string {
	return constant.RoleTable
}
