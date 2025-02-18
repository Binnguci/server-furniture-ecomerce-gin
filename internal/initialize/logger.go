package initialize

import (
	"server-car-rental-ecommerce-gin/global"
	"server-car-rental-ecommerce-gin/pkg/logger"
)

func InitLogger() {
	global.Logger = logger.NewLogger(global.Config.Logger)
}
