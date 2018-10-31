package admin

import (
	"log"
	"strings"

	"github.com/astaxie/beego"
)

type baseController struct {
	beego.Controller
	userID         int64
	userName       string
	moduleName     string
	controllerName string
	actionName     string
}

func (this *baseController) Prepare() {
	controllerName, actionName := this.GetControllerAndAction()
	this.moduleName = "admin"
	this.controllerName = strings.ToLower(controllerName[0 : len(controllerName)-10])
	this.actionName = strings.ToLower(actionName)
}

func (this *baseController) display(tpl ...string) {
	var tplName string
	if len(tpl) == 1 {
		tplName = this.moduleName + "/" + tpl[0] + ".html"
	} else {
		tplName = this.moduleName + "/" + this.controllerName + "/" + this.actionName + ".html"
	}
	log.Println("tplName ---------", tplName)
	this.Data["userID"] = this.userID
	this.Data["userName"] = this.userName
	this.Layout = this.moduleName + "/layout.html"
	this.TplName = tplName
}
