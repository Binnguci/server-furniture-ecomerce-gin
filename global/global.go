package global

import (
	"github.com/redis/go-redis/v9"
	"gorm.io/gorm"
	"server-book-ecommerce-gin/pkg/logger"
	"server-book-ecommerce-gin/pkg/setting"
)

var (
	Config setting.Config
	Logger *logger.LoggerZap
	Mdb    *gorm.DB
	Rdb    *redis.Client
)
