// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package model

import (
	"time"

	"gorm.io/gorm"
)

const TableNameAddress = "address"

// Address mapped from table <address>
type Address struct {
	ID          int32          `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	AddressLine string         `gorm:"column:address_line" json:"address_line"`
	Ward        string         `gorm:"column:ward" json:"ward"`
	District    string         `gorm:"column:district" json:"district"`
	Province    string         `gorm:"column:province" json:"province"`
	Country     string         `gorm:"column:country" json:"country"`
	IsDefault   bool           `gorm:"column:is_default" json:"is_default"`
	UserID      []byte         `gorm:"column:user_id;not null" json:"user_id"`
	CreatedAt   time.Time      `gorm:"column:created_at;default:CURRENT_TIMESTAMP" json:"created_at"`
	UpdatedAt   time.Time      `gorm:"column:updated_at;default:CURRENT_TIMESTAMP" json:"updated_at"`
	DeletedAt   gorm.DeletedAt `gorm:"column:deleted_at" json:"deleted_at"`
}

// TableName Address's table name
func (*Address) TableName() string {
	return TableNameAddress
}
