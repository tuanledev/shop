package admin

import (
	"fmt"
	"os"
	"shop/helper"
	"shop/models"
	"sort"

	"github.com/astaxie/beego/validation"
)

type ProductController struct {
	baseController
}

func (c *ProductController) List() {
	// get user
	product := models.Product{}
	productRows := []models.Product{}
	product.Query().All(&productRows, "id", "title_vn", "title_en", "sort", "images", "id_category", "price", "hot", "date")
	arrProduct := productRows
	// get category
	cate := models.Product{}
	cateRows := []models.Product{}
	cate.Query().All(&cateRows, "id", "title_vn")
	for key, v := range productRows {
		sort.Search(len(cateRows), func(i int) bool {
			if v.CategoryID == cateRows[i].Id {
				arrProduct[key].NameCategoryID = cateRows[i].TitleVN
			}
			return true
		})
	}
	c.Data["data"] = arrProduct
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/product/script_list.html"
	c.LayoutSections["Css"] = "admin/product/css_list.html"
	c.display()
}

func (c *ProductController) Add() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		product := models.Product{}
		c.ParseForm(&product)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&product)
		errMsg := make(map[string]string)
		// validation
		if pass {
			product.AliasVN = helper.StrToAlias(product.TitleVN)
			product.AliasEN = helper.StrToAlias(product.TitleEN)
			product.TitleVN = helper.TitleStrimSpace(product.TitleVN)
			product.TitleEN = helper.TitleStrimSpace(product.TitleEN)
			fImg, header, err := c.GetFile("Images")
			// if content-type images
			if fImg != nil && helper.CheckFileImage(header.Header.Get("Content-Type")) && err == nil {
				filePath := fmt.Sprintf("static/img/product/%s", header.Filename)
				err = c.SaveToFile("Images", filePath)
				if err != nil {
					c.showData("Lỗi", "Thêm hình không thành công", "")
				}
				product.Images = filePath
			}
			err = product.Insert()
			if err == nil {
				c.showData("Thành công", "Thêm thành công", "/admin/product/list")
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
	// get product
	cate := models.Product{}
	cateRows := []models.Product{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/product/script_add.html"
	c.LayoutSections["Css"] = "admin/product/css_add.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.display()
}

func (c *ProductController) Delete() {
	id, _ := c.GetInt("id")
	if id >= 0 {
		cate := models.Product{Id: id}
		if cate.Read() == nil {
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

func (c *ProductController) Deletes() {
	ids := []int{}
	c.Ctx.Input.Bind(&ids, "ids")
	if len(ids) > 0 {
		for _, id := range ids {
			cate := models.Product{Id: id}
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

func (c *ProductController) Edit() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		category := models.Product{}
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
					filePath := fmt.Sprintf("static/img/category/%s", header.Filename)
					err = c.SaveToFile("Images", filePath)
					if err != nil {
						c.showData("Lỗi", "Thêm hình không thành công", "")
					}
					category.Images = filePath
					// remove img old
					if imgOld != "" {
						os.Remove(imgOld)
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
	category := models.Product{Id: id}
	if err := category.Read(); err != nil {
		c.showmsg("error", "Lỗi", "")
		c.Redirect("/admin/category/list", 302)
	}

	// get category
	cate := models.Product{}
	cateRows := []models.Product{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/category/script_edit.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["data"] = category
	c.display()
}
