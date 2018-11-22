package admin

import (
	"fmt"
	"shop/helper"
)

type ImageController struct {
	baseController
}

func (c *ImageController) Upload() {
	// POST
	if c.Ctx.Input.Method() == "POST" {
		fImg, header, err := c.GetFile("file")
		// if content-type images
		// if upload file
		if fImg != nil && err == nil {
			// if content-type images
			contentType := header.Header.Get("Content-Type")
			if helper.CheckFileImage(contentType) {
				// check ext img
				if helper.CheckFileImage(contentType) {
					imgAliast := helper.StrToAlias(header.Filename)
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
}
