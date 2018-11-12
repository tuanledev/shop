package admin

import (
	"fmt"
	"shop/helper"
	"shop/models"
	"time"

	"github.com/astaxie/beego/validation"
)

type UserController struct {
	baseController
}

func (c *UserController) List() {
	// for index := 0; index < 100; index++ {

	// 	user := models.User{
	// 		Username: helper.RandStringRunes(100),
	// 		Password: "123456",
	// 		RoleID:   1,
	// 	}
	// 	if salt, err := helper.HashPassword(time.Now().String() + user.Username); err == nil {
	// 		user.Salt = salt
	// 	}
	// 	if hash, err := helper.HashPassword(user.Salt + user.Password); err == nil {
	// 		user.Hash = hash
	// 	}
	// 	user.Insert()
	// }
	user := models.User{}
	userRows := []models.User{}
	count, err := user.Query().All(&userRows, "username", "email", "role_id", "address", "last_login", "active")
	fmt.Println("count ", count, "err ", err)
	c.Data["dataUser"] = userRows
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/user/script_list.html"
	c.display()
}

func (c *UserController) Add() {
	// Ajax
	if c.IsAjax() {
		username := c.GetString("username")
		user := models.User{Username: username}
		err := user.Read("username")
		status := make(map[string]bool)
		if err == nil {
			status["status"] = true
		} else {
			status["status"] = false
		}
		c.Data["json"] = status
		c.ServeJSON()
		return
	}
	// POST
	if c.Ctx.Request.Method == "POST" {
		user := models.User{}
		c.ParseForm(&user)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&user)
		errMsg := make(map[string]string)
		// validation
		if pass {
			if salt, err := helper.HashPassword(time.Now().String() + user.Username); err == nil {
				user.Salt = salt
			}
			if hash, err := helper.HashPassword(user.Salt + user.Password); err == nil {
				user.Hash = hash
			}
			user.Insert()
		} else {
			for _, err := range valid.Errors {
				errMsg[err.Field] = err.Message
			}
			if user.RoleID == 0 {
				errMsg["Role"] = "Không được để trống"
			}
			c.Data["errMsg"] = errMsg
		}
	}
	// GET
	role := models.Role{}
	roles := []models.Role{}
	_, err := role.Query().All(&roles)
	if err == nil {
		c.Data["roles"] = roles
	}
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/user/script_add.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.display()
}
