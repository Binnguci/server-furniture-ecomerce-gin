// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package model

const TableNameRoomProduct = "room_products"

// RoomProduct mapped from table <room_products>
type RoomProduct struct {
	ID        int32 `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`
	RoomID    int32 `gorm:"column:room_id;not null" json:"room_id"`
	ProductID int32 `gorm:"column:product_id;not null" json:"product_id"`
}

// TableName RoomProduct's table name
func (*RoomProduct) TableName() string {
	return TableNameRoomProduct
}
