package admin

import (
	"html/template"
	"shop/helper"
	"shop/models"
	"time"

	"github.com/astaxie/beego/validation"
)

type UserController struct {
	baseController
}

func (c *UserController) List() {
	c.Data["Website"] = "tuanle123"
	c.Data["Email"] = "tuanle123@gmail.com"
	c.display()
}

func (c *UserController) Add() {
	if c.Ctx.Request.Method == "POST" {
		user := models.User{}
		c.ParseForm(&user)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&user)
		if pass {
			if salt, err := helper.HashPassword(time.Now().String() + user.Username); err == nil {
				user.Salt = salt
			}
			if hash, err := helper.HashPassword(user.Salt + user.Password); err == nil {
				user.Hash = hash
			}
			// validation
			user.Insert()
		}
	}
	role := models.Role{}
	roles := []models.Role{}
	_, err := role.Query().All(&roles)
	if err == nil {
		c.Data["roles"] = roles
	}
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/user/script_add.html"
	c.Data["xsrfdata"] = template.HTML(c.XSRFFormHTML())
	c.display()
}
