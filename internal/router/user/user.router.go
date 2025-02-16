package user

import (
	"github.com/gin-gonic/gin"
	"server-book-ecommerce-gin/internal/injector"
	"server-book-ecommerce-gin/internal/middleware"
)

type UserRouter struct{}

func (ur *UserRouter) InitUserRouter(Router *gin.RouterGroup) {

	userController, _ := injector.InitUserControllerHandler()
	//public router
	userRouterPublic := Router.Group("/user")
	{
		userRouterPublic.GET("/register", userController.Register)
		userRouterPublic.GET("/sign-in")

	}

	//private router
	userRouterPrivate := Router.Group("/product")
	userRouterPrivate.Use(middleware.AuthenticationMiddleware())
	//userRouterPrivate.Use(middleware.Limit())
	//userRouterPrivate.Use(middleware.Permission())
	{
		userRouterPublic.GET("/detail/:id")
		userRouterPrivate.POST("/update-info")

	}
}
