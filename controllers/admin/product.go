package admin

import (
	"fmt"
	"io"
	"os"
	"shop/helper"
	"shop/models"
	"sort"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
)

type ProductController struct {
	baseController
}

func (c *ProductController) List() {
	// get user
	product := models.Product{}
	productRows := []models.Product{}
	product.Query().All(&productRows, "id", "title_vn", "title_en", "sort", "images", "id_category", "price", "sale_price", "hot", "create", "new")
	arrProduct := productRows
	// get category
	cate := models.Category{}
	cateRows := []models.Category{}
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

			// get file images
			fImg, header, err := c.GetFile("Images")
			if fImg != nil && err == nil {
				contentType := header.Header.Get("Content-Type")
				// check ext img
				if helper.CheckFileImage(contentType) {
					fileName := helper.FormatNameImg(contentType, product.AliasVN)
					filePath := fmt.Sprintf("static/img/product/%s", fileName)
					err = c.SaveToFile("Images", filePath)
					if err != nil {
						c.showData("Lỗi", "Thêm hình không thành công", "")
					}
					product.Images = fileName
					// Resize
					helper.ResizeImg(200, 200, filePath)
				}
			}

			files, err := c.GetFiles("ImagesDetail")
			// get file mulpti images
			if len(files) > 0 && err == nil {
				for index, fileHeader := range files {
					contentType := fileHeader.Header.Get("Content-Type")
					// check ext img
					if helper.CheckFileImage(contentType) {
						fileName := fmt.Sprintf("%v-%s", index, helper.FormatNameImg(contentType, product.AliasVN))
						filePath := fmt.Sprintf("static/img/product/%s", fileName)
						file, err := fileHeader.Open()
						defer file.Close()
						f, err := os.OpenFile(filePath, os.O_WRONLY|os.O_CREATE, 0777)
						if err != nil {
							c.showData("Lỗi", "Thêm hình không thành công", "")
						}
						defer f.Close()
						io.Copy(f, file)
						switch index {
						case 0:
							product.Images1 = fileName
						case 1:
							product.Images2 = fileName
						case 2:
							product.Images3 = fileName
						case 3:
							product.Images4 = fileName
						case 4:
							product.Images5 = fileName
						}
						// Resize
						helper.ResizeImg(200, 200, filePath)
					}
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
	cate := models.Category{}
	cateRows := []models.Category{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/product/script_add.html"
	c.LayoutSections["Css"] = "admin/product/css_add.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["hostName"] = beego.AppConfig.String("httphost")
	c.display()
}

func (c *ProductController) Delete() {
	id, _ := c.GetInt("id")
	if id >= 0 {
		product := models.Product{Id: id}
		if product.Read() == nil {
			if product.Delete() == nil {
				os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images))
				os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images1))
				os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images2))
				os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images3))
				os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images4))
				os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images5))
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
			product := models.Product{Id: id}
			if product.Read() == nil {
				if product.Delete() == nil {
					os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images))
					os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images1))
					os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images2))
					os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images3))
					os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images4))
					os.Remove(fmt.Sprintf("%s%s", helper.PathImgProduct, product.Images5))
					c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
				} else {
					c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
				}
			}
		}
	}
	c.showmsg("error", "Lỗi", "Không có")
}

func (c *ProductController) Edit() {
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
			fImg, header, err := c.GetFile("Images")
			// if not update
			imgOld := c.GetString("image_old")
			if fImg == nil && imgOld != "" {
				product.Images = imgOld
			}
			// if upload file
			if fImg != nil && err == nil {
				// if content-type images
				if helper.CheckFileImage(header.Header.Get("Content-Type")) {
					filePath := fmt.Sprintf("static/img/product/%s", header.Filename)
					err = c.SaveToFile("Images", filePath)
					if err != nil {
						c.showData("Lỗi", "Thêm hình không thành công", "")
					}
					product.Images = filePath
					// remove img old
					if imgOld != "" {
						os.Remove(imgOld)
					}
				}
			}
			err = product.Update()
			if err == nil {
				c.showData("Thành công", "Sửa thành công", "/admin/product/list")
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
	product := models.Product{Id: id}
	if product.Read() != nil {
		c.showmsg("error", "Lỗi", "")
		c.Redirect("/admin/product/list", 302)
	}
	// get product
	cate := models.Category{}
	cateRows := []models.Category{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows

	imgProduct := []string{}
	imgProduct = append(imgProduct, product.Images, product.Images1, product.Images2, product.Images3, product.Images4, product.Images5)
	if len(imgProduct) > 0 {
		c.Data["images"] = imgProduct
	}
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/product/script_edit.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["data"] = product
	c.display()
}
