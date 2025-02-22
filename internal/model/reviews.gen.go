// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package model

import (
	"time"

	"gorm.io/gorm"
)

const TableNameReview = "reviews"

// Review mapped from table <reviews>
type Review struct {
	ID              int32          `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	ProductID       int32          `gorm:"column:product_id;not null" json:"product_id"`
	UserID          int64          `gorm:"column:user_id;not null" json:"user_id"`
	Rating          int32          `gorm:"column:rating;not null" json:"rating"`
	Like            int32          `gorm:"column:like;not null" json:"like"`
	Comment         string         `gorm:"column:comment" json:"comment"`
	ReviewsParentID int64          `gorm:"column:reviews_parent_id;not null" json:"reviews_parent_id"`
	CreatedAt       time.Time      `gorm:"column:created_at;default:CURRENT_TIMESTAMP" json:"created_at"`
	UpdatedAt       time.Time      `gorm:"column:updated_at;default:CURRENT_TIMESTAMP" json:"updated_at"`
	DeletedAt       gorm.DeletedAt `gorm:"column:deleted_at" json:"deleted_at"`
}

// TableName Review's table name
func (*Review) TableName() string {
	return TableNameReview
}
