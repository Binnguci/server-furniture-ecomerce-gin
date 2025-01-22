package router

import "server-book-ecommerce-gin/internal/router/user"

type RouterGroup struct {
	User user.UserRouterGroup
	//Admin admin.AdminRouterGroup
}

var RouterGroupApp = new(RouterGroup)
