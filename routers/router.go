package routers

import (
	"shop/controllers"
	"shop/controllers/admin"

	"github.com/astaxie/beego"
)

func init() {

	// Login
	beego.Router("/login", &controllers.AuthController{}, "*:Login")
	beego.Router("/logout", &controllers.AuthController{}, "*:Logout")

	//init namespace
	ns :=
		beego.NewNamespace("/admin",
			// Dashboard
			beego.NSRouter("/", &admin.DashboardController{}),
			beego.NSAutoRouter(
				// User
				&admin.UserController{},
			),
			beego.NSAutoRouter(
				// menu
				&admin.MenuController{},
			),
			beego.NSAutoRouter(
				// menu
				&admin.CategoryController{},
			),
			beego.NSAutoRouter(
				// menu
				&admin.ProductController{},
			),
		)

	//register namespace
	beego.AddNamespace(ns)

}
