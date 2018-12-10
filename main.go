package main

import (
	"fmt"
	"shop/controllers"
	"shop/helper"
	_ "shop/routers"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/plugins/cors"
	"github.com/astaxie/beego/validation"
)

func init() {
	// Set views path template
	beego.BConfig.WebConfig.ViewsPath = "views"
	// Set page errors
	beego.ErrorController(&controllers.ErrorController{})
	// Set cors
	beego.InsertFilter("*", beego.BeforeRouter, cors.Allow(&cors.Options{
		AllowAllOrigins:  true,
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Authorization", "Access-Control-Allow-Origin", "Content-Type"},
		ExposeHeaders:    []string{"Content-Length", "Access-Control-Allow-Origin"},
		AllowCredentials: true,
		MaxAge:           31536000,
	}))
	// Set validator
	validation.SetDefaultMessage(map[string]string{
		"Required": "Không được để trống",
		"Min":      "Số ký tự ít nhất là %d",
		"Max":      "Số ký tự cao nhất là %d",
		"Range":    "Khoảng %d đến %d",
		"MinSize":  "Kích thước thấp nhất là %d",
		"MaxSize":  "Kích thước tối đa là %d",
		"Length":   "Độ dài cho phép là %d",
		"Numeric":  "Phải là số",
		"Email":    "Email không hợp lệ",
	})
	// Set file ext
	beego.AddTemplateExt("html")

	// add func template
	beego.AddFuncMap("UrlHost", func() string {
		// func UrlHost
		urlHost := fmt.Sprintf("http://%s", beego.AppConfig.String("httphost"))
		// if beego.AppConfig.String("runmode") == "dev" {
		// 	// urlHost = fmt.Sprintf("http://%s:%s", beego.AppConfig.String("httpaddr"), beego.AppConfig.String("httpport"))
		// 	urlHost = fmt.Sprintf("http://)
		// 	return urlHost
		// }
		helper.PathHost = urlHost
		return urlHost
	})
}

func main() {
	// Run app
	beego.Run()

}
