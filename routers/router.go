package routers

import (
	"shop/controllers/admin"

	"github.com/astaxie/beego"
)

func init() {
	// Dashboard
	beego.Router("/admin", &admin.DashboardController{})

	// User
	beego.Router("/admin/user", &admin.UsersController{}, "*:List")
}
