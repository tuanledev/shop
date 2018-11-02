package routers

import (
	"shop/controllers"
	"shop/controllers/admin"

	"github.com/astaxie/beego"
)

func init() {
	// Dashboard
	beego.Router("/admin", &admin.DashboardController{})

	// User
	beego.Router("/admin/user", &admin.UserController{}, "*:List")
	beego.Router("/admin/user/create", &admin.UserController{}, "*:Create")

	// Login
	beego.Router("/login", &controllers.AuthController{}, "*:Login")
	beego.Router("/logout", &controllers.AuthController{}, "*:Logout")

}
