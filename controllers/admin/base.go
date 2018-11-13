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

func (c *baseController) showmsg(msg ...string) {
	if len(msg) == 1 {
		msg = append(msg, c.Ctx.Request.Referer())
	}
	// this.Data["userID"] = this.userID
	// this.Data["userName"] = this.userName
	// this.Data["levelMsg"] = msg[0]
	// this.Data["msg"] = msg[1]
	// this.Data["info"] = msg[2]
	// this.Data["redirect"] = msg[3]
	msgJson := make(map[string]string)
	msgJson["levelMsg"] = msg[0]
	msgJson["msg"] = msg[1]
	msgJson["info"] = msg[2]
	// msgJson["redirect"] = msg[3]

	c.Data["json"] = msgJson
	c.ServeJSON()
}
