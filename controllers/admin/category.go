package admin

import (
	"fmt"
	"shop/helper"
	"shop/models"

	"github.com/astaxie/beego/validation"
)

type CategoryController struct {
	baseController
}

func (c *CategoryController) List() {
	// get user
	menu := models.Menu{}
	menuRows := []models.Menu{}
	menu.Query().All(&menuRows, "id", "title_vn", "title_en", "sort", "active", "parent_id", "cate_product_id", "cate_news_id")
	nameParents := make(map[int]string)
	for _, v := range menuRows {
		if v.ParentID != 0 {
			continue
		}
		nameParents[v.Id] = v.TitleVN
	}
	arrMenu := menuRows
	for i, v := range menuRows {
		if v.ParentID == 0 {
			continue
		}
		if name, exist := nameParents[v.ParentID]; exist {
			arrMenu[i].NameParentID = name
		}
	}
	c.Data["data"] = arrMenu
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/menu/script_list.html"
	c.LayoutSections["Css"] = "admin/menu/css_list.html"
	c.display()
}

func (c *CategoryController) Add() {
	// Ajax
	if c.IsAjax() {
		username := c.GetString("username")
		user := models.User{Username: username}
		err := user.Read("username")
		status := make(map[string]bool)
		if err == nil {
			status["status"] = true
		} else {
			status["status"] = false
		}
		c.Data["json"] = status
		c.ServeJSON()
		return
	}
	// POST
	if c.Ctx.Request.Method == "POST" {
		menu := models.Menu{}
		c.ParseForm(&menu)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&menu)
		errMsg := make(map[string]string)
		// validation
		if pass {
			menu.AliasVN = helper.StrToAlias(menu.TitleVN)
			menu.AliasEN = helper.StrToAlias(menu.TitleEN)
			err := menu.Insert()
			if err == nil {
				c.showData("Thành công", "Thêm thành công", "/admin/menu/list")
			} else {
				c.showData("Lỗi", "Sửa không thành công", "")
			}
		} else {
			for _, err := range valid.Errors {
				errMsg[err.Field] = err.Message
			}
			c.Data["errMsg"] = errMsg
		}
	}
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/menu/script_add.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.display()
}

func (c *CategoryController) Delete() {
	id, _ := c.GetInt("id")
	if id == 1 {
		c.showmsg("error", "Lỗi", "không được quyền xóa")
	}
	if id >= 0 {
		menu := models.Menu{Id: id}
		if menu.Read() == nil {
			err := menu.Delete()
			if err == nil {
				c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
			} else {
				c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
			}
		}
	}
	c.showmsg("error", "Lỗi", "Không có id người dùng")
}

func (c *CategoryController) Deletes() {
	ids := []int{}
	c.Ctx.Input.Bind(&ids, "ids")
	if len(ids) > 0 {
		for _, id := range ids {
			menu := models.Menu{Id: id}
			err := menu.Delete()
			if err == nil {
				c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
			} else {
				c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
			}
		}
	}
	c.showmsg("error", "Lỗi", "Không có menu")
}

func (c *CategoryController) Edit() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		menu := models.Menu{}
		c.ParseForm(&menu)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&menu)
		errMsg := make(map[string]string)
		// validation
		if pass {
			menu.AliasVN = helper.StrToAlias(menu.TitleVN)
			menu.AliasEN = helper.StrToAlias(menu.TitleEN)
			err := menu.Update()
			if err == nil {
				c.showData("Thành công", "Thêm thành công", "/admin/menu/list")
			} else {
				c.showData("Lỗi", "Sửa không thành công", "")
			}
		} else {
			for _, err := range valid.Errors {
				errMsg[err.Field] = err.Message
			}
			c.Data["errMsg"] = errMsg
		}
	}
	// GET
	id, _ := c.GetInt("id")
	menu := models.Menu{Id: id}
	if err := menu.Read(); err != nil {
		c.showmsg("error", "Lỗi", "")
		c.Redirect("/admin/menu/list", 302)
	}
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/menu/script_edit.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["data"] = menu
	c.display()
}
