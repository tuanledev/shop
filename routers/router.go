package routers

import (
	"shop/controllers"
	"shop/controllers/admin"
	"shop/controllers/frontend"

	"github.com/astaxie/beego"
)

func init() {
	// Login
	beego.Router("/login", &controllers.AuthController{}, "*:Login")
	beego.Router("/logout", &controllers.AuthController{}, "*:Logout")
	// set lang
	beego.Router("/", &frontend.IndexController{}, "*:Index")
	// index
	beego.Router("/set-lang", &frontend.IndexController{}, "*:SetLang")
	// post
	beego.Router("/tin-tuc/:urlname([a-z-0-9]+).html", &frontend.PostController{}, "*:Detail")
	beego.Router("/tin-tuc/:idcate([0-9]+)", &frontend.PostController{}, "*:Category")
	beego.Router("/tin-tuc/", &frontend.PostController{}, "*:CategoryAll")
	// product
	beego.Router("/san-pham/", &frontend.ProductController{}, "*:CategoryAll")
	beego.Router("/san-pham/:idcate([0-9]+)", &frontend.ProductController{}, "*:Category")
	beego.Router("/san-pham/:urlname([a-z-0-9]+).html", &frontend.ProductController{}, "*:Detail")
	// about
	beego.Router("/gioi-thieu/", &frontend.IndexController{}, "*:About")
	// contact
	beego.Router("/lien-he/", &frontend.IndexController{}, "*:Contact")
	// search
	beego.Router("/tim-kiem/", &frontend.IndexController{}, "*:Search")
	// lang
	beego.Router("/:lang([a-z]+)", &frontend.IndexController{}, "*:Index")

	// en
	nsEn :=
		beego.NewNamespace("/en",
			// post
			beego.NSRouter("/blog/:urlname([a-z-0-9]+).html", &frontend.PostController{}, "*:Detail"),
			beego.NSRouter("/blog/:idcate([0-9]+)", &frontend.PostController{}, "*:Category"),
			beego.NSRouter("/blog/", &frontend.PostController{}, "*:CategoryAll"),
			// about
			beego.NSRouter("/about/", &frontend.IndexController{}, "*:About"),
			// contact
			beego.NSRouter("/contact/", &frontend.IndexController{}, "*:Contact"),
			// product
			beego.NSRouter("/product/", &frontend.ProductController{}, "*:CategoryAll"),
			beego.NSRouter("/product/:idcate([0-9]+)", &frontend.ProductController{}, "*:Category"),
			beego.NSRouter("/product/:urlname([a-z-0-9]+).html", &frontend.ProductController{}, "*:Detail"),
			// search
			beego.NSRouter("/search/", &frontend.IndexController{}, "*:Search"),
		)

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
			beego.NSAutoRouter(
				// contact
				&admin.ContactController{},
			),
		)

	//register namespace
	beego.AddNamespace(ns, nsEn)

}
