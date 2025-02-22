// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package model

import (
	"time"

	"gorm.io/gorm"
)

const TableNameSupplier = "suppliers"

// Supplier mapped from table <suppliers>
type Supplier struct {
	ID           int32          `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	Name         string         `gorm:"column:name;not null" json:"name"`
	ContactEmail string         `gorm:"column:contact_email" json:"contact_email"`
	ContactPhone string         `gorm:"column:contact_phone" json:"contact_phone"`
	Address      string         `gorm:"column:address" json:"address"`
	Country      string         `gorm:"column:country" json:"country"`
	Website      string         `gorm:"column:website" json:"website"`
	IsActive     int32          `gorm:"column:is_active;default:1" json:"is_active"`
	CreatedAt    time.Time      `gorm:"column:created_at;default:CURRENT_TIMESTAMP" json:"created_at"`
	UpdatedAt    time.Time      `gorm:"column:updated_at;default:CURRENT_TIMESTAMP" json:"updated_at"`
	DeletedAt    gorm.DeletedAt `gorm:"column:deleted_at" json:"deleted_at"`
}

// TableName Supplier's table name
func (*Supplier) TableName() string {
	return TableNameSupplier
}
