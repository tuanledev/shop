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
	// get user
	user := models.User{}
	userRows := []models.User{}
	count, err := user.Query().All(&userRows, "id", "username", "email", "role_id", "address", "last_login", "active")
	fmt.Println("count ", count, "err ", err)
	c.Data["dataUser"] = userRows
	// get roles
	role := models.Role{}
	roles := []models.Role{}
	_, err = role.Query().All(&roles)
	if err == nil {
		c.Data["roles"] = roles
	}

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/user/script_list.html"
	c.LayoutSections["Css"] = "admin/user/css_list.html"
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

func (c *UserController) Delete() {
	id, _ := c.GetInt("id")
	if id == 1 {
		c.showmsg("error", "Lỗi", "không được quyền xóa")
	}
	if id >= 0 {
		user := models.User{Id: id}
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

func (c *UserController) Deletes() {
	ids := []int{}
	c.Ctx.Input.Bind(&ids, "ids")
	if len(ids) > 0 {
		for _, id := range ids {
			if id == 1 {
				c.showmsg("error", "Lỗi", "không được quyền xóa")
				continue
			}
			user := models.User{Id: id}
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

func (c *UserController) Edit() {
	// POST
	if c.Ctx.Request.Method == "POST" {
		user := models.User{}
		c.ParseForm(&user)
		valid := validation.Validation{}
		pass, _ := valid.Valid(&user)
		errMsg := make(map[string]string)
		// validation
		if pass {
			fmt.Println("user ", user)
			if user.Password != "" {
				// if password not change
				if salt, err := helper.HashPassword(time.Now().String() + user.Username); err == nil {
					user.Salt = salt
				}
				if hash, err := helper.HashPassword(user.Salt + user.Password); err == nil {
					user.Hash = hash
				}
				err := user.Update("email", "role_id", "hash", "salt", "fullname", "address", "active")
				if err != nil {
					c.showData("Lỗi", "Sửa không thành công", "")
				} else {
					c.showData("Thành công", "Sửa Thành công", "/admin/user/list")
				}
			} else {
				err := user.Update("email", "role_id", "fullname", "address", "active")
				if err != nil {
					c.showData("Lỗi", "Sửa không thành công", "")
				} else {
					c.showData("Thành công", "Sửa Thành công", "/admin/user/list")
				}
			}
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
	id, _ := c.GetInt("id")
	user := models.User{Id: id}
	if err := user.Read(); err != nil {
		c.showmsg("error", "Lỗi", "")
		c.Redirect("/admin/user/list", 302)
	}
	role := models.Role{}
	roles := []models.Role{}
	_, err := role.Query().All(&roles)
	if err == nil {
		c.Data["roles"] = roles
	}
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Scripts"] = "admin/user/script_edit.html"
	c.Data["xsrf_token"] = c.XSRFToken()
	c.Data["user"] = user
	c.display()
}
