package frontend

import (
	"bytes"
	"fmt"
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
	setting        models.Setting
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

	// // 2. Get language information from cookies.
	// if len(lang) == 0 {
	// 	lang = "vi-VN"
	// 	c.Ctx.SetCookie("lang", lang, 1<<31-1, "/")
	// } else {
	// 	if lang == "en" {
	// 		lang = "en-US"
	// 		c.Ctx.SetCookie("lang", lang, 1<<31-1, "/")
	// 	}
	// }

	lang := ""
	// 1. Check URL arguments.
	// lang := c.Ctx.Input.Param(":lang")
	url := c.Ctx.Input.URL()
	if len(url) > 2 {
		arrUrl := strings.Split(url, "/")
		fmt.Println("arrUrl ", arrUrl)
		if strings.Compare(arrUrl[1], "en") == 0 {
			lang = "en-US"
		} else {
			lang = "vi-VN"
		}
	} else {
		lang = "vi-VN"
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
	// get cookie
	// if c.Ctx.GetCookie("lang") != "" {
	// 	lang = c.Ctx.GetCookie("lang")
	// }
	// Check again in case someone modify on purpose.
	if !i18n.IsExist(lang) {
		lang = ""
	}
	// 4. Default language is English.
	if len(lang) == 0 {
		lang = "vi-VN"
	}
	c.Lang = lang
	// Set template level language option.
	c.Data["Lang"] = c.Lang
	controllerName, actionName := c.GetControllerAndAction()
	c.moduleName = "frontend"
	c.controllerName = strings.ToLower(controllerName[0 : len(controllerName)-10])
	c.actionName = strings.ToLower(actionName)

	// get cookie
	if c.Ctx.GetCookie("logo") == "" {
		setting := models.Setting{Id: 1}
		if setting.Read() == nil {
			c.Ctx.SetCookie("logo", setting.Logo, helper.TimeDay)
		}
	}
	if c.Ctx.GetCookie("icon") == "" {
		setting := models.Setting{Id: 1}
		if setting.Read() == nil {
			c.Ctx.SetCookie("icon", setting.Icon, helper.TimeDay)
		}
	}

	// get menu
	category := models.Category{}
	categorys := []models.Category{}
	category.Query().OrderBy("id").All(&categorys)
	categoryData := &bytes.Buffer{}
	helper.ShowCategory(categorys, 0, c.Lang, categoryData, 0)
	c.Data["category"] = categoryData.String()

	// get news
	cateNew := models.CateNew{}
	cateNews := []models.CateNew{}
	cateNew.Query().OrderBy("id").All(&cateNews)
	cateNewData := &bytes.Buffer{}
	helper.ShowCateNews(cateNews, 0, c.Lang, cateNewData, 0)
	c.Data["catenews"] = cateNewData.String()

	// get setting web
	setting := models.Setting{Id: 1}
	if setting.Read() == nil {
		c.Data["setting"] = setting
		c.setting = setting
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
		c.Data["meta_keywords"] = params[1]
	}
	if len(params) > 2 {
		c.Data["meta_description"] = params[2]
	}
}
