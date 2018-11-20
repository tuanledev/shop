package admin

import (
	"fmt"
	"os"
	"shop/helper"
	"shop/models"
	"sort"

	"github.com/astaxie/beego/validation"
)

type CategoryController struct {
	baseController
}

func (c *CategoryController) List() {
	// get user
	cate := models.Category{}
	cateRows := []models.Category{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en", "sort", "images", "parent_id")
	arrCates := cateRows
	for key, v := range cateRows {
		sort.Search(len(cateRows), func(i int) bool {
			if v.ParentID == cateRows[i].Id {
				arrCates[key].NameParentID = cateRows[i].TitleVN
			}
			return true
		})
	}
	c.Data["data"] = arrCates
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/category/script_list.html"
	c.LayoutSections["Css"] = "admin/category/css_list.html"
	c.display()
}

func (c *CategoryController) Add() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		category := models.Category{}
		c.ParseForm(&category)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&category)
		errMsg := make(map[string]string)
		// validation
		if pass {
			category.AliasVN = helper.StrToAlias(category.TitleVN)
			category.AliasEN = helper.StrToAlias(category.TitleEN)
			fImg, header, err := c.GetFile("Images")
			// if content-type images
			if fImg != nil && helper.CheckFileImage(header.Header.Get("Content-Type")) && err == nil {
				filePath := fmt.Sprintf("static/img/category/%s", header.Filename)
				err = c.SaveToFile("Images", header.Filename)
				if err != nil {
					c.showData("Lỗi", "Thêm hình không thành công", "")
				}
				// Resize
				helper.ResizeImg(200, 200, filePath)
				category.Images = filePath
			}
			err = category.Insert()
			if err == nil {
				c.showData("Thành công", "Thêm thành công", "/admin/category/list")
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
	c.Data["cates"] = cateRows
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/category/script_add.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.display()
}

func (c *CategoryController) Delete() {
	id, _ := c.GetInt("id")
	if id >= 0 {
		cate := models.Category{Id: id}
		if cate.Read() == nil {
			// delete img

			err := cate.Delete()
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
			cate := models.Category{Id: id}
			err := cate.Delete()
			if err == nil {
				c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
			} else {
				c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
			}
		}
	}
	c.showmsg("error", "Lỗi", "Không có cate")
}

func (c *CategoryController) Edit() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		category := models.Category{}
		c.ParseForm(&category)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&category)
		errMsg := make(map[string]string)
		// validation
		if pass {
			category.AliasVN = helper.StrToAlias(category.TitleVN)
			category.AliasEN = helper.StrToAlias(category.TitleEN)
			fImg, header, err := c.GetFile("Images")
			// if no update
			imgOld := c.GetString("image_old")
			if fImg == nil && imgOld != "" {
				category.Images = imgOld
			}
			// if upload file
			if fImg != nil && err == nil {
				// if content-type images
				if helper.CheckFileImage(header.Header.Get("Content-Type")) {
					filePath := fmt.Sprintf("%s%s", helper.PathImgCategory, header.Filename)
					err = c.SaveToFile("Images", filePath)
					if err != nil {
						c.showData("Lỗi", "Thêm hình không thành công", "")
					}
					// Resize
					helper.ResizeImg(200, 200, filePath)
					category.Images = header.Filename
					// remove img old
					if imgOld != "" {
						os.Remove(fmt.Sprintf("%s%s", helper.PathImgCategory, imgOld))
					}
				}
			}
			err = category.Update()
			if err == nil {
				c.showData("Thành công", "Sửa thành công", "/admin/category/list")
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
	category := models.Category{Id: id}
	if err := category.Read(); err != nil {
		c.showmsg("error", "Lỗi", "")
		c.Redirect("/admin/category/list", 302)
	}

	// get category
	cate := models.Category{}
	cateRows := []models.Category{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/category/script_edit.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["data"] = category
	c.display()
}
