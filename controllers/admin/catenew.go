package admin

import (
	"fmt"
	"os"
	"shop/helper"
	"shop/models"
	"sort"

	"github.com/astaxie/beego/validation"
)

type CatenewController struct {
	baseController
}

func (c *CatenewController) List() {
	// get user
	cate := models.CateNew{}
	cateRows := []models.CateNew{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en", "sort", "parent_id", "images")
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
	c.LayoutSections["Scripts"] = "admin/catenew/script_list.html"
	c.LayoutSections["Css"] = "admin/catenew/css_list.html"
	c.display()
}

func (c *CatenewController) Add() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		category := models.CateNew{}
		c.ParseForm(&category)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&category)
		errMsg := make(map[string]string)
		// validation
		if pass {
			category.AliasVN = helper.StrToAlias(category.TitleVN)
			category.AliasEN = helper.StrToAlias(category.TitleEN)
			category.TitleVN = helper.TitleStrimSpace(category.TitleVN)
			category.TitleEN = helper.TitleStrimSpace(category.TitleEN)
			fImg, header, err := c.GetFile("Images")
			// if content-type images
			if fImg != nil && err == nil {
				contentType := header.Header.Get("Content-Type")
				// check ext img
				if helper.CheckFileImage(contentType) {
					fileName := helper.FormatNameImg(contentType, category.AliasVN)
					filePath := fmt.Sprintf("static/img/catenew/%s", fileName)
					err = c.SaveToFile("Images", filePath)
					if err != nil {
						c.showData("Lỗi", "Thêm hình không thành công", "")
					}
					// Resize
					helper.ResizeImg(1200, 500, filePath)
					category.Images = fileName
				}
			}
			err = category.Insert()
			if err == nil {
				c.showData("Thành công", "Thêm thành công", "/admin/catenew/list")
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
	cate := models.CateNew{}
	cateRows := []models.CateNew{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/catenew/script_add.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.display()
}

func (c *CatenewController) Delete() {
	id, _ := c.GetInt("id")
	if id >= 0 {
		cate := models.CateNew{Id: id}
		if cate.Read() == nil {
			if cate.Delete() == nil {
				// delete img
				os.Remove(fmt.Sprintf("%s%s", helper.PathImgCatenew, cate.Images))
				c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
			} else {
				c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
			}
		}
	}
	c.showmsg("error", "Lỗi", "Không có id người dùng")
}

func (c *CatenewController) Deletes() {
	ids := []int{}
	c.Ctx.Input.Bind(&ids, "ids")
	if len(ids) > 0 {
		for _, id := range ids {
			cate := models.CateNew{Id: id}
			if cate.Read() == nil {
				if cate.Delete() == nil {
					// delete img
					os.Remove(fmt.Sprintf("%s%s", helper.PathImgCatenew, cate.Images))
					c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
				} else {
					c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
				}
			}
		}
	}
	c.showmsg("error", "Lỗi", "Không có cate")
}

func (c *CatenewController) Edit() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		category := models.CateNew{}
		c.ParseForm(&category)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&category)
		errMsg := make(map[string]string)
		// validation
		if pass {
			category.AliasVN = helper.StrToAlias(category.TitleVN)
			category.AliasEN = helper.StrToAlias(category.TitleEN)
			category.TitleVN = helper.TitleStrimSpace(category.TitleVN)
			category.TitleEN = helper.TitleStrimSpace(category.TitleEN)
			fImg, header, err := c.GetFile("Images")
			// if no update
			imgOld := c.GetString("image_old")
			if fImg == nil && imgOld != "" {
				category.Images = imgOld
			}
			// if upload file
			if fImg != nil && err == nil {
				// if content-type images
				contentType := header.Header.Get("Content-Type")
				// check ext img
				if helper.CheckFileImage(contentType) {
					fileName := helper.FormatNameImg(contentType, category.AliasVN)
					filePath := fmt.Sprintf("%s%s", helper.PathImgCatenew, fileName)
					err = c.SaveToFile("Images", filePath)
					if err != nil {
						c.showData("Lỗi", "Thêm hình không thành công", "")
					}
					// Resize
					helper.ResizeImg(1200, 500, filePath)
					category.Images = fileName
					// remove img old
					if imgOld != "" {
						os.Remove(fmt.Sprintf("%s%s", helper.PathImgCatenew, imgOld))
					}
				}
			}
			err = category.Update()
			if err == nil {
				c.showData("Thành công", "Sửa thành công", "/admin/catenew/list")
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
	category := models.CateNew{Id: id}
	if err := category.Read(); err != nil {
		c.showmsg("error", "Lỗi", "")
		c.Redirect("/admin/catenew/list", 302)
	}

	// get category
	cate := models.CateNew{}
	cateRows := []models.CateNew{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/catenew/script_edit.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["data"] = category
	c.display()
}
