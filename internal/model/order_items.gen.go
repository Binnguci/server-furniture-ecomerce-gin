// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package model

import (
	"time"

	"gorm.io/gorm"
)

const TableNameOrderItem = "order_items"

// OrderItem mapped from table <order_items>
type OrderItem struct {
	ID        int64          `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	OrderID   int64          `gorm:"column:order_id;not null" json:"order_id"`
	ProductID int32          `gorm:"column:product_id;not null" json:"product_id"`
	Quantity  int32          `gorm:"column:quantity;not null" json:"quantity"`
	Price     float64        `gorm:"column:price;not null" json:"price"`
	CreatedAt time.Time      `gorm:"column:created_at;default:CURRENT_TIMESTAMP" json:"created_at"`
	UpdatedAt time.Time      `gorm:"column:updated_at;default:CURRENT_TIMESTAMP" json:"updated_at"`
	DeletedAt gorm.DeletedAt `gorm:"column:deleted_at" json:"deleted_at"`
}

// TableName OrderItem's table name
func (*OrderItem) TableName() string {
	return TableNameOrderItem
}
