// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package model

import (
	"time"

	"gorm.io/gorm"
)

const TableNameDrivingLicense = "driving_license"

// DrivingLicense mapped from table <driving_license>
type DrivingLicense struct {
	ID             int32          `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	FrontImage     string         `gorm:"column:front_image;not null" json:"front_image"`
	BackImage      string         `gorm:"column:back_image;not null" json:"back_image"`
	UserID         string         `gorm:"column:user_id" json:"user_id"`
	LicenseNumber  string         `gorm:"column:license_number;not null" json:"license_number"`
	LicenseType    string         `gorm:"column:license_type;not null" json:"license_type"`
	IssueDate      time.Time      `gorm:"column:issue_date;not null" json:"issue_date"`
	ExpirationDate time.Time      `gorm:"column:expiration_date;not null" json:"expiration_date"`
	CreatedAt      time.Time      `gorm:"column:created_at;default:CURRENT_TIMESTAMP" json:"created_at"`
	UpdatedAt      time.Time      `gorm:"column:updated_at;default:CURRENT_TIMESTAMP" json:"updated_at"`
	DeletedAt      gorm.DeletedAt `gorm:"column:deleted_at" json:"deleted_at"`
}

// TableName DrivingLicense's table name
func (*DrivingLicense) TableName() string {
	return TableNameDrivingLicense
}
