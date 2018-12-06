package admin

import (
	"fmt"
	"shop/models"
)

type ContactController struct {
	baseController
}

func (c *ContactController) List() {
	// get user
	user := models.Contact{}
	userRows := []models.Contact{}
	user.Query().OrderBy("-id").All(&userRows)
	c.Data["data"] = userRows
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/contact/script_list.html"
	c.LayoutSections["Css"] = "admin/contact/css_list.html"
	c.display()
}

func (c *ContactController) Delete() {
	id, _ := c.GetInt("id")
	if id >= 0 {
		user := models.Contact{Id: id}
		if user.Read() == nil {
			err := user.Delete()
			if err == nil {
				c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
			} else {
				c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
			}
		}
	}
	c.showmsg("error", "Lỗi", "Không có id người dùng")
}

func (c *ContactController) Deletes() {
	ids := []int{}
	c.Ctx.Input.Bind(&ids, "ids")
	if len(ids) > 0 {
		for _, id := range ids {
			user := models.Contact{Id: id}
			err := user.Delete()
			if err == nil {
				c.showmsg("success", "Thành công", fmt.Sprintf("Xóa thành công %v", id))
			} else {
				c.showmsg("error", "Lỗi", fmt.Sprintf("Xóa không thành công %v", id))
			}
		}
	}
	c.showmsg("error", "Lỗi", "Không có id người dùng")
	// c.Redirect("/admin/user/list", 302)
}
