package user

import (
	"github.com/gin-gonic/gin"
	"server-car-rental-ecommerce-gin/internal/injector"
)

type UserRouter struct{}

func (ur *UserRouter) InitUserRouter(Router *gin.RouterGroup) {

	userController, _ := injector.InitUserControllerHandler()
	//public router
	userRouterPublic := Router.Group("/auth")
	{
		userRouterPublic.GET("/register", userController.Register)
		userRouterPublic.GET("/sign-in")
	}

	//private router
	userRouterPrivate := Router.Group("/product")
	//userRouterPrivate.Use(middleware.AuthenticationMiddleware())
	//userRouterPrivate.Use(middleware.Limit())
	//userRouterPrivate.Use(middleware.Permission())
	{
		userRouterPublic.GET("/detail/:id")
		userRouterPrivate.POST("/update-info")

	}
}
