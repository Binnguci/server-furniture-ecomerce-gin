package initialize

import "_server-furniture-ecommerce-gin/global"

func Run() {
	LoadConfig()
	InitLogger()
	global.Logger.Info("Logger init success")
	InitMySQL()
	InitRedis()
	InitRouter()

	r := InitRouter()
	r.Run(":8082")
}
