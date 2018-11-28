package routers

import (
	"shop/controllers"
	"shop/controllers/admin"
	"shop/controllers/fontend"

	"github.com/astaxie/beego"
)

func init() {

	// Login
	beego.Router("/login", &controllers.AuthController{}, "*:Login")
	beego.Router("/logout", &controllers.AuthController{}, "*:Logout")

	//index
	beego.Router("/", &fontend.IndexController{}, "*:Index")

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
				// category
				&admin.CategoryController{},
			),
			beego.NSAutoRouter(
				// product
				&admin.ProductController{},
			),
			beego.NSAutoRouter(
				// image
				&admin.ImageController{},
			),
			beego.NSAutoRouter(
				// cate new
				&admin.CatenewController{},
			),
			beego.NSAutoRouter(
				// post
				&admin.PostController{},
			),
			beego.NSAutoRouter(
				// cate image
				&admin.CateimageController{},
			),
			beego.NSAutoRouter(
				// setting
				&admin.SettingController{},
			),
		)

	//register namespace
	beego.AddNamespace(ns)

}
