package admin

import (
	"fmt"
	"shop/helper"
	"shop/models"
	"sort"

	"github.com/astaxie/beego/validation"
)

type MenuController struct {
	baseController
}

func (c *MenuController) List() {
	// get menu
	menu := models.Menu{}
	menuRows := []models.Menu{}
	menu.Query().All(&menuRows, "id", "title_vn", "title_en", "sort", "active", "parent_id", "cate_product_id", "cate_news_id")
	arrMenu := menuRows
	// get category
	cate := models.Category{}
	cateRows := []models.Category{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	for key, v := range menuRows {
		sort.Search(len(cateRows), func(i int) bool {
			if v.CateProductID == cateRows[i].Id {
				arrMenu[key].NameProductID = cateRows[i].TitleVN
			}
			return true
		})
		sort.Search(len(menuRows), func(i int) bool {
			if menuRows[i].Id == arrMenu[key].ParentID {
				arrMenu[key].NameParentID = v.TitleVN
			}
			return true
		})
	}
	c.Data["data"] = arrMenu
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/menu/script_list.html"
	c.LayoutSections["Css"] = "admin/menu/css_list.html"
	c.display()
}

func (c *MenuController) Edit() {
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
			menu.TitleVN = helper.TitleStrimSpace(menu.TitleVN)
			menu.TitleEN = helper.TitleStrimSpace(menu.TitleEN)
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
	// get menu
	menu := models.Menu{Id: id}
	if err := menu.Read(); err != nil {
		c.showmsg("error", "Lỗi", "")
		c.Redirect("/admin/menu/list", 302)
	}
	// get category
	cate := models.Category{}
	cateRows := []models.Category{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/menu/script_edit.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["data"] = menu
	c.Data["cate"] = cate
	c.display()
}

func (c *MenuController) Add() {
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
			menu.TitleEN = helper.TitleStrimSpace(menu.TitleEN)
			menu.TitleVN = helper.TitleStrimSpace(menu.TitleVN)
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
	// get category
	cate := models.Category{}
	cateRows := []models.Category{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")

	// get menu
	menu := models.Menu{}
	menuRows := []models.Menu{}
	menu.Query().All(&menuRows, "id", "title_vn", "title_en")

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/menu/script_add.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["cates"] = cateRows
	c.Data["menus"] = menuRows
	c.display()
}

func (c *MenuController) Delete() {
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

func (c *MenuController) Deletes() {
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
