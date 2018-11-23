package admin

import (
	"fmt"
	"os"
	"shop/helper"
	"shop/models"
	"sort"

	"github.com/astaxie/beego/validation"
)

type PostController struct {
	baseController
}

func (c *PostController) List() {
	// get user
	product := models.Post{}
	productRows := []models.Post{}
	product.Query().All(&productRows, "id", "title_vn", "title_en", "sort", "images", "id_category", "hot", "create", "new")
	arrProduct := productRows
	// get category
	cate := models.CateNew{}
	cateRows := []models.CateNew{}
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
	c.LayoutSections["Scripts"] = "admin/post/script_list.html"
	c.LayoutSections["Css"] = "admin/post/css_list.html"
	c.display()
}

func (c *PostController) Add() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		product := models.Post{}
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
			// get file images
			fImg, header, err := c.GetFile("Images")
			if fImg != nil && err == nil {
				contentType := header.Header.Get("Content-Type")
				// check ext img
				if helper.CheckFileImage(contentType) {
					fileName := helper.FormatNameImg(contentType, product.AliasVN)
					filePath := fmt.Sprintf("static/img/post/%s", fileName)
					err = c.SaveToFile("Images", filePath)
					if err != nil {
						c.showData("Lỗi", "Thêm hình không thành công", "")
					}
					product.Images = fileName
					// Resize
					helper.ResizeImg(200, 200, filePath)
				}
			}
			if c.GetString("Hot") == "on" {
				product.Hot = 1
			}
			if c.GetString("New") == "on" {
				product.New = 1
			}
			err = product.Insert()
			if err == nil {
				c.showData("Thành công", "Thêm thành công", "/admin/post/list")
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
	cate := models.CateNew{}
	cateRows := []models.CateNew{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/post/script_add.html"
	c.LayoutSections["Css"] = "admin/post/css_add.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.display()
}

func (c *PostController) Delete() {
	id, _ := c.GetInt("id")
	if id >= 0 {
		product := models.Post{Id: id}
		if product.Read() == nil {
			if product.Delete() == nil {
				os.Remove(fmt.Sprintf("%s%s", helper.PathImgPost, product.Images))
				c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
			} else {
				c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
			}
		}
	}
	c.showmsg("error", "Lỗi", "Không có id người dùng")
}

func (c *PostController) Deletes() {
	ids := []int{}
	c.Ctx.Input.Bind(&ids, "ids")
	if len(ids) > 0 {
		for _, id := range ids {
			product := models.Post{Id: id}
			if product.Read() == nil {
				if product.Delete() == nil {
					os.Remove(fmt.Sprintf("%s%s", helper.PathImgPost, product.Images))
					c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
				} else {
					c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
				}
			}
		}
	}
	c.showmsg("error", "Lỗi", "Không có")
}

func (c *PostController) Edit() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		product := models.Post{}
		c.ParseForm(&product)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&product)
		errMsg := make(map[string]string)
		// validation
		if pass {
			if c.GetString("Hot") == "on" {
				product.Hot = 1
			} else {
				product.Hot = 0
			}
			if c.GetString("New") == "on" {
				product.New = 1
			} else {
				product.New = 0
			}
			product.AliasVN = helper.StrToAlias(product.TitleVN)
			product.AliasEN = helper.StrToAlias(product.TitleEN)
			product.TitleVN = helper.TitleStrimSpace(product.TitleVN)
			product.TitleEN = helper.TitleStrimSpace(product.TitleEN)
			if product.Update("title_vn", "title_en", "description_vn", "description_en", "content_vn", "content_en", "id_category", "sort", "hot", "alias_vn", "alias_en", "new") == nil {
				c.showData("Thành công", "Sửa thành công", "/admin/post/list")
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
	product := models.Post{Id: id}
	if product.Read() != nil {
		c.showmsg("error", "Lỗi", "")
	}
	// get product
	cate := models.CateNew{}
	cateRows := []models.CateNew{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/post/script_edit.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["data"] = product
	c.display()
}

func (c *PostController) UploadImage() {
	// POST
	if c.IsAjax() {
		id, _ := c.GetInt("id")
		if id != 0 {
			product := models.Post{Id: id}
			if product.Read() != nil {
				c.showmsg("error", "Lỗi", "")
			}
			fImg, header, err := c.GetFile("file")
			// if upload file
			if fImg != nil && err == nil {
				contentType := header.Header.Get("Content-Type")
				// check ext img
				if helper.CheckFileImage(contentType) {
					fileName := fmt.Sprintf(helper.FormatNameImg(contentType, product.AliasVN))
					filePath := fmt.Sprintf("static/img/post/%s", fileName)
					err = c.SaveToFile("file", filePath)
					if err != nil {
						c.showmsg("error", "Lỗi", "")
					}
					// Resize
					helper.ResizeImg(200, 200, filePath)
					product.Images = fileName
					if product.Update("images") == nil {
						c.showImg("success", "Thành công", "", filePath)
					} else {
						c.showmsg("error", "Lỗi", "")
					}
				}
			}

		} else {
			c.showmsg("error", "Lỗi", "")
		}
	}
}

func (c *PostController) RemoveImage() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		id, _ := c.GetInt("id")
		if id != 0 {
			product := models.Post{Id: id}
			if product.Read() != nil {
				c.showmsg("error", "Lỗi", "")
			}
			// Remove
			os.Remove(fmt.Sprintf("%s%s", helper.PathImgPost, product.Images))
			product.Images = ""
			if product.Update("images") == nil {
				c.showImg("success", "Thành công", "", "")
			} else {
				c.showmsg("error", "Lỗi", "")
			}
		}
	}
}
