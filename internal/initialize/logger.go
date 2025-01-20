package initialize

import (
	"_server-furniture-ecommerce-gin/global"
	"_server-furniture-ecommerce-gin/pkg/logger"
)

func InitLogger() {
	global.Logger = logger.NewLogger(global.Config.Logger)
}
