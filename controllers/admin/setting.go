package admin

import (
	"fmt"
	"os"
	"shop/helper"
	"shop/models"
	"strings"
)

type SettingController struct {
	baseController
}

func (c *SettingController) Edit() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		setting := models.Setting{}
		c.ParseForm(&setting)
		// get file logo
		fImg, header, err := c.GetFile("Logo")
		// if no update
		imgLogo := c.GetString("image_Logo")
		if fImg == nil && imgLogo != "" {
			setting.Logo = imgLogo
		}
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
				filePath := fmt.Sprintf("%s%s", helper.PathImgSetting, fileName)
				err = c.SaveToFile("Logo", filePath)
				if err != nil {
					c.showData("Lỗi", "Thêm hình không thành công", "")
				}
				setting.Logo = fileName
				// remove img old
				if imgLogo != "" {
					os.Remove(fmt.Sprintf("%s%s", helper.PathImgSetting, imgLogo))
				}
				c.Ctx.SetCookie("logo", setting.Logo, helper.TimeYear)
				// Resize
				helper.ResizeImg(200, 200, filePath)
			}
		}
		// get file icon
		fIcon, iconHeader, err := c.GetFile("Icon")
		// if no update
		imgIcon := c.GetString("image_Icon")
		if fImg == nil && imgIcon != "" {
			setting.Icon = imgIcon
		}
		if fIcon != nil && err == nil {
			contentType := iconHeader.Header.Get("Content-Type")
			// check ext img
			if helper.CheckFileImage(contentType) {
				imgAliast := helper.StrToAlias(iconHeader.Filename)
				imgAliast = strings.Trim(imgAliast, ".png")
				imgAliast = strings.Trim(imgAliast, ".jpg")
				imgAliast = strings.Trim(imgAliast, ".gif")
				imgAliast = strings.Trim(imgAliast, ".jpeg")
				imgAliast = strings.Trim(imgAliast, ".pjpeg")
				fileName := helper.FormatNameImg(contentType, imgAliast)
				filePath := fmt.Sprintf("%s%s", helper.PathImgSetting, fileName)
				err = c.SaveToFile("Icon", filePath)
				if err != nil {
					c.showData("Lỗi", "Thêm hình không thành công", "")
				}
				setting.Icon = fileName
				// remove img old
				if imgIcon != "" {
					os.Remove(fmt.Sprintf("%s%s", helper.PathImgSetting, imgIcon))
				}
				c.Ctx.SetCookie("icon", setting.Icon, helper.TimeYear)
				// Resize
				helper.ResizeImg(200, 200, filePath)
			}
		}
		setting.TitleVN = helper.TitleStrimSpace(setting.TitleVN)
		setting.TitleEN = helper.TitleStrimSpace(setting.TitleEN)
		setting.DescriptionVN = helper.TitleStrimSpace(setting.DescriptionVN)
		setting.DescriptionEN = helper.TitleStrimSpace(setting.DescriptionEN)
		setting.KeywordVN = helper.TitleStrimSpace(setting.KeywordVN)
		setting.KeywordEN = helper.TitleStrimSpace(setting.KeywordEN)
		if setting.Update() == nil {
			c.showData("Thành công", "Sửa thành công", "/admin")
		} else {
			c.showData("Lỗi", "Sửa không thành công", "")
		}
	}
	// Get
	setting := models.Setting{Id: 1}
	setting.Read()
	c.Data["data"] = setting
	c.Data["xsrf_token"] = c.XSRFToken()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/setting/script_edit.html"
	c.display()
}
