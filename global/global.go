package global

import (
	"github.com/redis/go-redis/v9"
	"gorm.io/gorm"
	"server-car-rental-ecommerce-gin/pkg/logger"
	"server-car-rental-ecommerce-gin/pkg/setting"
)

var (
	Config setting.Config
	Logger *logger.LoggerZap
	Pdb    *gorm.DB
	Rdb    *redis.Client
)
