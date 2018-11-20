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
		if fImg != nil && helper.CheckFileImage(header.Header.Get("Content-Type")) && err == nil {
			fileName := header.Filename
			filePath := fmt.Sprintf("static/filemanager/product/%s", fileName)
			err = c.SaveToFile("file", filePath)
			if err != nil {
				c.showmsg("error", "Thêm hình không thành công", err.Error())
			}
			dataJson := make(map[string]string)
			dataJson["imgPath"] = fmt.Sprintf("%s/%s", helper.PathHost, filePath)
			dataJson["status"] = "success"
			c.Data["json"] = dataJson
			// Resize
			helper.ResizeImg(200, 200, filePath)
			c.ServeJSON()
		}
	}
}
