package controllers

import (
	"github.com/astaxie/beego"
)

type ErrorController struct {
	beego.Controller
}

func (c *ErrorController) Error400() {
	c.Data["content"] = "page not found"
	c.TplName = "errors/400.html"
	c.display()
}

func (c *ErrorController) Error403() {
	c.Data["content"] = "database is now down"
	c.TplName = "errors/403.html"
	c.display()
}

func (c *ErrorController) Error404() {
	c.Data["content"] = "page notfound "
	c.TplName = "errors/404.html"
	c.display()
}

func (c *ErrorController) Error500() {
	c.Data["content"] = "internal server error"
	c.TplName = "errors/500.html"
	c.display()
}

func (c *ErrorController) Error503() {
	c.Data["content"] = "internal server error"
	c.TplName = "errors/503.html"
	c.display()
}

func (c *ErrorController) display() {
	c.Layout = "errors/layout.html"
}
