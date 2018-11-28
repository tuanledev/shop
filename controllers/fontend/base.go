package fontend

import (
	"shop/helper"
	"shop/models"
	"strings"

	"github.com/astaxie/beego"
	"github.com/beego/i18n"
)

type baseController struct {
	beego.Controller
	options  map[string]string
	right    string
	page     int
	pagesize int
	i18n.Locale
	moduleName     string
	controllerName string
	actionName     string
}

var langTypes []string // Languages that are supported.

func init() {
	beego.AddFuncMap("i18n", i18n.Tr)

	// Initialize language type list.
	langTypes = strings.Split(beego.AppConfig.String("lang_types"), "|")

	// Load locale files according to language types.
	for _, lang := range langTypes {
		beego.Trace("Loading language: " + lang)
		if err := i18n.SetMessage(lang, "conf/"+"locale_"+lang+".ini"); err != nil {
			beego.Error("Fail to set message file:", err)
			return
		}
	}
}

func (c *baseController) Prepare() {
	// Reset language option.
	hasCookie := false
	// 1. Check URL arguments.
	lang := c.Input().Get("lang")

	// 2. Get language information from cookies.
	if len(lang) == 0 {
		lang = c.Ctx.GetCookie("lang")
		hasCookie = true
	}

	// Check again in case someone modify on purpose.
	if !i18n.IsExist(lang) {
		lang = ""
		hasCookie = false
	}

	// 3. Get language information from 'Accept-Language'.
	if len(lang) == 0 {
		al := c.Ctx.Request.Header.Get("Accept-Language")
		if len(al) > 4 {
			al = al[:5] // Only compare first 5 letters.
			if i18n.IsExist(al) {
				lang = al
			}
		}
	}

	// 4. Default language is English.
	if len(lang) == 0 {
		lang = "vi"
	}
	// Save language information in cookies.
	if !hasCookie {
		c.Ctx.SetCookie("lang", lang, 1<<31-1, "/")
	}
	c.Lang = lang

	// Set template level language option.
	c.Data["Lang"] = c.Lang
	controllerName, actionName := c.GetControllerAndAction()
	c.moduleName = "fontend"
	c.controllerName = strings.ToLower(controllerName[0 : len(controllerName)-10])
	c.actionName = strings.ToLower(actionName)

	// get cookie
	if c.Ctx.GetCookie("logo") == "" || c.Ctx.GetCookie("icon") == "" {
		setting := models.Setting{Id: 1}
		if setting.Read() == nil {
			c.Ctx.SetCookie("logo", setting.Logo, helper.TimeYear)
		}
	}
	if c.Ctx.GetCookie("icon") == "" {
		setting := models.Setting{Id: 1}
		if setting.Read() == nil {
			c.Ctx.SetCookie("icon", setting.Icon, helper.TimeYear)
		}
	}
}

func (c *baseController) display(tpl string) {
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["header"] = c.moduleName + "/header.html"
	c.LayoutSections["footer"] = c.moduleName + "/footer.html"
	c.Data["logo"] = c.Ctx.GetCookie("logo")
	c.Data["icon"] = c.Ctx.GetCookie("icon")
	c.Layout = c.moduleName + "/layout.html"
	c.TplName = c.moduleName + "/" + tpl
}

func (c *baseController) setHeadMetas(params ...string) {
	if len(params) > 0 {
		c.Data["title"] = params[0]
	}
	if len(params) > 1 {
		c.Data["keywords"] = params[1]
	}
	if len(params) > 2 {
		c.Data["description"] = params[2]
	}
}
