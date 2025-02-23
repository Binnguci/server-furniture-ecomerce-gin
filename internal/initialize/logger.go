package initialize

import (
	"server-furniture-ecommerce-gin/global"
	"server-furniture-ecommerce-gin/pkg/logger"
)

func InitLogger() {
	global.Logger = logger.NewLogger(global.Config.Logger)
}
