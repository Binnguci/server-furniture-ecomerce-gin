package global

import (
	"_server-furniture-ecommerce-gin/pkg/logger"
	"_server-furniture-ecommerce-gin/pkg/setting"
	"github.com/redis/go-redis/v9"
	"gorm.io/gorm"
)

var (
	Config setting.Config
	Logger *logger.LoggerZap
	Mdb    *gorm.DB
	Rdb    *redis.Client
)
