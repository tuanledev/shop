package admin

import (
	"strings"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/session"
)

type baseController struct {
	beego.Controller
	userID         int
	userName       string
	moduleName     string
	controllerName string
	actionName     string
	Session        session.Store
	RoleID         int
}

func (c *baseController) Prepare() {
	// Check session auth
	// if c.GetSession("username") == nil {
	// 	c.Redirect("/login", 302)
	// }
	controllerName, actionName := c.GetControllerAndAction()
	c.moduleName = "admin"
	c.controllerName = strings.ToLower(controllerName[0 : len(controllerName)-10])
	c.actionName = strings.ToLower(actionName)
}

func (c *baseController) display(tpl ...string) {
	var tplName string
	if len(tpl) == 1 {
		tplName = c.moduleName + "/" + tpl[0] + ".html"
	} else {
		tplName = c.moduleName + "/" + c.controllerName + "/" + c.actionName + ".html"
	}
	c.Data["userId"] = c.GetSession("userId")
	c.Data["username"] = c.GetSession("username")
	c.Layout = c.moduleName + "/layout.html"
	c.TplName = tplName
}
