package admin

import (
	"fmt"
	"io"
	"os"
	"shop/helper"
	"shop/models"
	"sort"
	"strings"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
)

type ImageController struct {
	baseController
}

func (c *ImageController) Upload() {
	// POST
	if c.Ctx.Input.Method() == "POST" {
		fImg, header, err := c.GetFile("file")
		// if upload file
		if fImg != nil && err == nil {
			// if content-type images
			contentType := header.Header.Get("Content-Type")
			// check ext img
			if helper.CheckFileImage(contentType) {
				imgAliast := helper.StrToAlias(header.Filename)
				imgAliast = strings.Trim(imgAliast, ".png")
				imgAliast = strings.Trim(imgAliast, ".jpg")
				imgAliast = strings.Trim(imgAliast, ".gif")
				imgAliast = strings.Trim(imgAliast, ".jpeg")
				imgAliast = strings.Trim(imgAliast, ".pjpeg")
				fileName := helper.FormatNameImg(contentType, imgAliast)
				filePath := fmt.Sprintf("%s%s", helper.PathImgFileManager, fileName)
				err = c.SaveToFile("file", filePath)
				if err != nil {
					c.showmsg("error", "Thêm hình không thành công", err.Error())
				}
				dataJson := make(map[string]string)
				// dataJson["imgPath"] = fmt.Sprintf("%s/%s", helper.PathHost, filePath)
				dataJson["imgPath"] = fmt.Sprintf("/%s", filePath)
				dataJson["status"] = "success"
				c.Data["json"] = dataJson
				// Resize
				helper.ResizeImg(200, 200, filePath)
				c.ServeJSON()
			}
		}
	}
}

func (c *ImageController) List() {
	// get user
	image := models.Image{}
	imageRows := []models.Image{}
	image.Query().All(&imageRows, "id", "images", "cate_id", "sort", "date")
	arrImage := imageRows
	// get category
	cate := models.CateImage{}
	cateRows := []models.CateImage{}
	cate.Query().All(&cateRows, "id", "title_vn")
	for key, v := range imageRows {
		sort.Search(len(cateRows), func(i int) bool {
			if v.CateID == cateRows[i].Id {
				arrImage[key].NameCateID = cateRows[i].TitleVN
			}
			return true
		})
	}
	c.Data["data"] = arrImage
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/image/script_list.html"
	c.LayoutSections["Css"] = "admin/image/css_list.html"
	c.display()
}

func (c *ImageController) Add() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		image := models.Image{}
		c.ParseForm(&image)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&image)
		errMsg := make(map[string]string)
		// validation
		if pass {
			// get file multi images
			files, err := c.GetFiles("ImagesDetail")
			if len(files) > 0 && err == nil {
				sortImg := c.GetString("SortImage")
				for index, fileHeader := range files {
					images := models.Image{}
					images.CateID, _ = c.GetInt("CateID")
					contentType := fileHeader.Header.Get("Content-Type")
					// check ext img
					if helper.CheckFileImage(contentType) {
						imgAliast := helper.StrToAlias(fileHeader.Filename)
						imgAliast = strings.Trim(imgAliast, ".png")
						imgAliast = strings.Trim(imgAliast, ".jpg")
						imgAliast = strings.Trim(imgAliast, ".gif")
						imgAliast = strings.Trim(imgAliast, ".jpeg")
						imgAliast = strings.Trim(imgAliast, ".pjpeg")
						fileName := fmt.Sprintf("%v-%s", index, helper.FormatNameImg(contentType, imgAliast))
						filePath := fmt.Sprintf("%s%s", helper.PathImgImage, fileName)
						file, err := fileHeader.Open()
						defer file.Close()
						f, err := os.OpenFile(filePath, os.O_WRONLY|os.O_CREATE, 0777)
						if err != nil {
							c.showData("Lỗi", "Thêm hình không thành công", "")
						}
						defer f.Close()
						io.Copy(f, file)
						images.Images = fileName
						// Resize
						helper.ResizeImg(200, 200, filePath)
						// get sort img
						if sortImg == "on" {
							images.Sort = index
						}
						// insert img
						if images.Insert() == nil {
							c.showData("Thành công", "Thêm thành công", "/admin/image/list")
						} else {
							c.showData("Lỗi", "Thêm không thành công", "")
						}
					}
				}
			} else {
				// get file images
				fImg, header, err := c.GetFile("Images")
				if fImg != nil && err == nil {
					contentType := header.Header.Get("Content-Type")
					// check ext img
					if helper.CheckFileImage(contentType) {
						imgAliast := helper.StrToAlias(header.Filename)
						imgAliast = strings.Trim(imgAliast, ".png")
						imgAliast = strings.Trim(imgAliast, ".jpg")
						imgAliast = strings.Trim(imgAliast, ".gif")
						imgAliast = strings.Trim(imgAliast, ".jpeg")
						imgAliast = strings.Trim(imgAliast, ".pjpeg")
						fileName := helper.FormatNameImg(contentType, imgAliast)
						filePath := fmt.Sprintf("%s%s", helper.PathImgImage, fileName)
						err = c.SaveToFile("Images", filePath)
						if err != nil {
							c.showData("Lỗi", "Thêm hình không thành công", "")
						}
						image.Images = fileName
						// Resize
						helper.ResizeImg(200, 200, filePath)
					}
				}
				if image.Insert() == nil {
					c.showData("Thành công", "Thêm thành công", "/admin/image/list")
				} else {
					c.showData("Lỗi", "Thêm không thành công", "")
				}
			}
		} else {
			for _, err := range valid.Errors {
				errMsg[err.Field] = err.Message
			}
			c.Data["errMsg"] = errMsg
		}
	}
	// get product
	cate := models.CateImage{}
	cateRows := []models.CateImage{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/image/script_add.html"
	c.LayoutSections["Css"] = "admin/image/css_add.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["hostName"] = beego.AppConfig.String("httphost")
	c.display()
}

func (c *ImageController) Delete() {
	id, _ := c.GetInt("id")
	if id >= 0 {
		image := models.Image{Id: id}
		if image.Read() == nil {
			if image.Delete() == nil {
				os.Remove(fmt.Sprintf("%s%s", helper.PathImgImage, image.Images))
				c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
			} else {
				c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
			}
		}
	}
	c.showmsg("error", "Lỗi", "")
}

func (c *ImageController) Deletes() {
	ids := []int{}
	c.Ctx.Input.Bind(&ids, "ids")
	if len(ids) > 0 {
		for _, id := range ids {
			image := models.Image{Id: id}
			if image.Read() == nil {
				if image.Delete() == nil {
					os.Remove(fmt.Sprintf("%s%s", helper.PathImgImage, image.Images))
					c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
				} else {
					c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
				}
			}
		}
	}
	c.showmsg("error", "Lỗi", "Không có")
}

func (c *ImageController) Edit() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		image := models.Image{}
		c.ParseForm(&image)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&image)
		errMsg := make(map[string]string)
		// validation
		if pass {
			fImg, header, err := c.GetFile("Images")
			// if no update
			imgOld := c.GetString("image_old")
			if fImg == nil && imgOld != "" {
				image.Images = imgOld
			}
			// if upload file
			if fImg != nil && err == nil {
				// if content-type images
				contentType := header.Header.Get("Content-Type")
				// check ext img
				if helper.CheckFileImage(contentType) {
					imgAliast := helper.StrToAlias(header.Filename)
					imgAliast = strings.Trim(imgAliast, ".png")
					imgAliast = strings.Trim(imgAliast, ".jpg")
					imgAliast = strings.Trim(imgAliast, ".gif")
					imgAliast = strings.Trim(imgAliast, ".jpeg")
					imgAliast = strings.Trim(imgAliast, ".pjpeg")
					fileName := helper.FormatNameImg(contentType, imgAliast)
					filePath := fmt.Sprintf("%s%s", helper.PathImgImage, fileName)
					err = c.SaveToFile("Images", filePath)
					if err != nil {
						c.showData("Lỗi", "Thêm hình không thành công", "")
					}
					// Resize
					helper.ResizeImg(200, 200, filePath)
					image.Images = fileName
					// remove img old
					if imgOld != "" {
						os.Remove(fmt.Sprintf("%s%s", helper.PathImgImage, imgOld))
					}
				}
			}
			if image.Update("images", "cate_id", "sort") == nil {
				c.showData("Thành công", "Sửa thành công", "/admin/image/list")
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
	product := models.Image{Id: id}
	if product.Read() != nil {
		c.showmsg("error", "Lỗi", "")
	}
	// get product
	cate := models.CateImage{}
	cateRows := []models.CateImage{}
	cate.Query().All(&cateRows, "id", "title_vn", "title_en")
	c.Data["cates"] = cateRows

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/image/script_edit.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["data"] = product
	c.display()
}

func (c *ImageController) Edits() {
	// POST
	if c.IsAjax() {
		sort, _ := c.GetInt("sort")
		id, _ := c.GetInt("id")
		action := c.GetString("action")
		// upload sort
		if id > 0 && action == "sort" {
			image := models.Image{Id: id, Sort: sort}
			if image.Update("sort") == nil {
				c.showMsgs("success", "Thành công", "", sort)
			} else {
				c.showMsgs("error", "Lỗi", "", sort)
			}
		}
		// Remove
		if id > 0 && action == "remove" {
			image := models.Image{Id: id}
			if image.Read() != nil {
				c.showmsg("error", "Lỗi", "")
			}
			if image.Delete() == nil {
				os.Remove(fmt.Sprintf("%s%s", helper.PathImgImage, image.Images))
				c.showImg("success", "Thành công", "", "")
			} else {
				c.showmsg("error", "Lỗi", "")
			}
		}
		// Upload
		if id > 0 && action == "upload" {
			image := models.Image{Id: id}
			if image.Read() != nil {
				c.showmsg("error", "Lỗi", "")
			}
			// Upload
			fImg, header, err := c.GetFile("file")
			// if upload file
			if fImg != nil && err == nil {
				contentType := header.Header.Get("Content-Type")
				// check ext img
				if helper.CheckFileImage(contentType) {
					imgAliast := helper.StrToAlias(header.Filename)
					imgAliast = strings.Trim(imgAliast, ".png")
					imgAliast = strings.Trim(imgAliast, ".jpg")
					imgAliast = strings.Trim(imgAliast, ".gif")
					imgAliast = strings.Trim(imgAliast, ".jpeg")
					imgAliast = strings.Trim(imgAliast, ".pjpeg")
					fileName := helper.FormatNameImg(contentType, imgAliast)
					filePath := fmt.Sprintf("%s%s", helper.PathImgImage, fileName)
					err = c.SaveToFile("file", filePath)
					if err != nil {
						c.showmsg("error", "Lỗi", "")
					}
					// Resize
					helper.ResizeImg(200, 200, filePath)
					image.Images = fileName
					if image.Update("images") == nil {
						c.showImg("success", "Thành công", "", filePath)
					} else {
						c.showmsg("error", "Lỗi", "")
					}
				}
			}
		}
	}
	// GET
	cateId, _ := c.GetInt("cateid")
	image := models.Image{}
	images := []models.Image{}
	image.Query().Filter("cate_id", cateId).All(&images)
	if len(images) == 0 {
		c.Redirect("/admin/image/list", 302)
	}
	c.Data["images"] = images
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/image/script_edits.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.display()
}
