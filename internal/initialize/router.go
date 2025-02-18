package initialize

import (
	helmet "github.com/danielkov/gin-helmet"
	"github.com/gin-gonic/gin"
	"server-car-rental-ecommerce-gin/global"
	"server-car-rental-ecommerce-gin/internal/middleware"
	"server-car-rental-ecommerce-gin/internal/router"
)

func InitRouter() *gin.Engine {
	var r *gin.Engine
	if global.Config.Server.Mode == "dev" {
		gin.SetMode(gin.DebugMode)
		gin.ForceConsoleColor()
		r = gin.Default()
	} else {
		gin.SetMode(gin.ReleaseMode)
		gin.New()
	}
	//middleware
	r.Use(middleware.CorsMiddleware())
	r.Use(helmet.Default())
	// .. các middleware khác
	userRouter := router.RouterGroupApp.User
	//adminRouter := router.RouterGroupApp.Admin

	MainGroup := r.Group("/v1/api")
	{
		MainGroup.GET("/check-status") // tracking monitor
	}
	{
		userRouter.InitUserRouter(MainGroup)
		userRouter.InitProductRouter(MainGroup)
	}
	//{
	//	adminRouter.InitUserRouter(MainGroup)
	//	adminRouter.InitProductRouter(MainGroup)
	//}
	return r
}
