// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package model

import (
	"server-book-ecommerce-gin/internal/constant"
	"time"

	"gorm.io/gorm"
)

const TableNameUserLog = constant.UserLogTable

// UserLog mapped from table <user_logs>
type UserLog struct {
	ID        int32          `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	UserID    int64          `gorm:"column:user_id" json:"user_id"`
	Action    string         `gorm:"column:action" json:"action"`
	Message   string         `gorm:"column:message" json:"message"`
	LogLevel  string         `gorm:"column:log_level" json:"log_level"`
	IPAddress string         `gorm:"column:ip_address" json:"ip_address"`
	CreatedAt time.Time      `gorm:"column:created_at;default:CURRENT_TIMESTAMP" json:"created_at"`
	UpdatedAt time.Time      `gorm:"column:updated_at;default:CURRENT_TIMESTAMP" json:"updated_at"`
	DeletedAt gorm.DeletedAt `gorm:"column:deleted_at" json:"deleted_at"`
}

// TableName UserLog's table name
func (*UserLog) TableName() string {
	return TableNameUserLog
}
