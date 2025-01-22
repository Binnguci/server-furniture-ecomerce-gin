package model

import "time"

type Base struct {
	CreatedAt time.Time `json:"created_at" gorm:"column:created_at;type:timestamp"`
	UpdatedAt time.Time `json:"updated_at" gorm:"column:updated_at;type:timestamp"`
	DeletedAt time.Time `json:"deleted_at" gorm:"column:deleted_at;type:timestamp"`
}
