package routers

import (
	"shop/controllers"
	"shop/controllers/admin"
	"shop/controllers/frontend"

	"github.com/astaxie/beego"
)

func init() {
	// var langTypes []string // Languages that are supported.
	// beego.AddFuncMap("i18n", i18n.Tr)
	// // Initialize language type list.
	// langTypes = strings.Split(beego.AppConfig.String("lang_types"), "|")

	// // Load locale files according to language types.
	// for _, lang := range langTypes {
	// 	beego.Trace("Loading language: " + lang)
	// 	if err := i18n.SetMessage(lang, "conf/"+"locale_"+lang+".ini"); err != nil {
	// 		beego.Error("Fail to set message file:", err)
	// 		return
	// 	}
	// }

	// Login
	beego.Router("/login", &controllers.AuthController{}, "*:Login")
	beego.Router("/logout", &controllers.AuthController{}, "*:Logout")

	beego.Router("/", &frontend.IndexController{}, "*:Index")

	// vi
	beego.Router("/:lang([a-z]+)", &frontend.IndexController{}, "*:Index")
	// nsEn :=
	// 	beego.NewNamespace("/en",
	// 		// Dashboard
	// 		beego.NSRouter("/a", &frontend.IndexController{}, "*:Index"),
	// 	)

	// //register namespace
	// beego.AddNamespace(nsEn)

	//en
	// beego.Router("/:lang[a-zA-Z]", &frontend.IndexController{}, "*:Index")
	// nsEN :=
	// 	beego.NewNamespace("/:lang[a-zA-Z]",
	// 		// Dashboard
	// 		beego.NSRouter("/", &frontend.IndexController{}, "*:Index"),
	// 	)

	// //register namespace
	// beego.AddNamespace(nsEN)

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
