package global

import (
	"github.com/redis/go-redis/v9"
	"gorm.io/gorm"
	"server-furniture-ecommerce-gin/pkg/logger"
	"server-furniture-ecommerce-gin/pkg/setting"
)

var (
	Config setting.Config
	Logger *logger.LoggerZap
	Mdb    *gorm.DB
	Rdb    *redis.Client
)
