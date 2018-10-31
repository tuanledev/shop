package main

import (
	"shop/controllers"
	_ "shop/routers"

	"github.com/astaxie/beego"
)

func main() {
	// Set views path template
	beego.BConfig.WebConfig.ViewsPath = "views"
	// Set page errors
	beego.ErrorController(&controllers.ErrorController{})

	// Run app
	beego.Run()
}
