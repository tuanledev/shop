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
	menu.Query().All(&menuRows, "id", "title_vn", "title_en", "sort", "active", "parent_id", "cate_product_id", "cate_news_id", "post_id")
	arrMenu := menuRows
	// get category
	cate := models.Category{}
	cateRows := []models.Category{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	// get CateNew
	cateNews := models.CateNew{}
	cateNewsRows := []models.CateNew{}
	cateNews.Query().All(&cateNewsRows, "id", "title_vn", "title_en")
	// get name post

	for key, v := range menuRows {
		// name product parent
		sort.Search(len(cateRows), func(i int) bool {
			if v.CateProductID == cateRows[i].Id {
				arrMenu[key].NameProductID = cateRows[i].TitleVN
			}
			return true
		})
		// name CateNew
		sort.Search(len(cateNewsRows), func(i int) bool {
			if v.CateNewsID == cateNewsRows[i].Id {
				arrMenu[key].NameNewsID = cateNewsRows[i].TitleVN
			}
			return true
		})
		// name  menu
		sort.Search(len(menuRows), func(j int) bool {
			if menuRows[j].Id == arrMenu[key].ParentID {
				arrMenu[key].NameParentID = menuRows[j].TitleVN
			}
			return true
		})
		// get name post
		if v.PostID > 0 {
			post := models.Post{Id: v.PostID}
			if post.Read() == nil {
				arrMenu[key].NamePostID = post.TitleVN
			}
		}
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
			menu.ParentID, _ = c.GetInt("ParentID")
			menu.CateProductID, _ = c.GetInt("CateProductID")
			menu.CateNewsID, _ = c.GetInt("CateNewsID")
			menu.PostID, _ = c.GetInt("PostID")
			if menu.PostID > 0 {
				menu.CateNewsID = 0
			}
			if c.GetString("Active") == "on" {
				menu.Active = 1
			} else {
				menu.Active = 0
			}
			if menu.Update() == nil {
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
	}
	// get category
	cate := models.Category{}
	cateRows := []models.Category{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows
	// get menus
	menuCate := models.Menu{}
	menuRows := []models.Menu{}
	menuCate.Query().All(&menuRows, "id", "title_vn", "title_en", "cate_product_id", "cate_news_id")
	c.Data["menus"] = menuRows
	// get cates post
	cateNews := models.CateNew{}
	cateNewsRows := []models.CateNew{}
	cateNews.Query().All(&cateNewsRows, "id", "title_vn", "title_en")
	c.Data["cateNews"] = cateNewsRows
	// get name post
	if menu.PostID > 0 {
		post := models.Post{Id: menu.PostID}
		if post.Read() == nil {
			menu.NamePostID = post.TitleVN
		}
	}

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/menu/script_edit.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["data"] = menu
	c.display()
}

func (c *MenuController) Add() {
	// ajax
	if c.IsAjax() {
		cateNews, _ := c.GetInt("id_cate_news")
		if cateNews > 0 {
			posts := models.Post{}
			postRows := []models.Post{}
			_, err := posts.Query().Filter("id_category", cateNews).All(&postRows, "id", "title_vn", "id_category")
			status := make(map[string]interface{})
			if err == nil {
				status["status"] = true
				status["data"] = postRows
			} else {
				status["status"] = false
			}
			c.Data["json"] = status
			c.ServeJSON()
			return
		}
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
			menu.ParentID, _ = c.GetInt("ParentID")
			menu.CateProductID, _ = c.GetInt("CateProductID")
			menu.CateNewsID, _ = c.GetInt("CateNewsID")
			menu.PostID, _ = c.GetInt("PostID")
			if menu.PostID > 0 {
				menu.CateNewsID = 0
			}
			if c.GetString("Active") == "on" {
				menu.Active = 1
			} else {
				menu.Active = 0
			}
			if menu.Insert() == nil {
				c.showData("Thành công", "Thêm thành công", "/admin/menu/list")
			} else {
				c.showData("Lỗi", "Thêm không thành công", "")
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

	// get posts
	post := models.CateNew{}
	postRows := []models.CateNew{}
	post.Query().All(&postRows, "id", "title_vn", "title_en")

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/menu/script_add.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["cates"] = cateRows
	c.Data["menus"] = menuRows
	c.Data["posts"] = postRows
	c.display()
}

func (c *MenuController) Delete() {
	id, _ := c.GetInt("id")
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
