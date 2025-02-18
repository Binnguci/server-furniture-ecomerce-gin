package initialize

import (
	"server-car-rental-ecommerce-gin/global"
	"strconv"
)

func Run() {
	LoadConfig()
	InitLogger()
	InitPostgreSQL()
	InitRedis()
	InitRouter()

	r := InitRouter()
	port := global.Config.Server.Port
	r.Run(":" + strconv.Itoa(port))
}
