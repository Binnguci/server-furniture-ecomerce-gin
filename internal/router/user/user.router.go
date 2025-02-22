package user

import (
	"github.com/gin-gonic/gin"
	"server-furniture-ecommerce-gin/internal/injector"
	"server-furniture-ecommerce-gin/internal/middleware"
)

type UserRouter struct{}

func (ur *UserRouter) InitUserRouter(Router *gin.RouterGroup) {

	userController, _ := injector.InitUserControllerHandler()
	//public router
	userRouterPublic := Router.Group("/user")
	{
		userRouterPublic.POST("/register", userController.Register)
	}

	//private router
	userRouterPrivate := Router.Group("/auth")
	userRouterPrivate.Use(middleware.AuthenticationMiddleware())
	userRouterPrivate.Use(middleware.PermissionMiddleware())
	{

	}
}
