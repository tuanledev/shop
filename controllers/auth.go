package controllers

import (
	"fmt"
	"html/template"
	"shop/helper"
	"shop/models"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
)

type AuthController struct {
	beego.Controller
}

type formAuth struct {
	Username string `form:"username" valid:"Required"`
	Password string `form:"password" valid:"Required"`
}

func (c *AuthController) Prepare() {

}

// Login Check login user
func (c *AuthController) Login() {
	c.StartSession()
	// Check session
	if c.GetSession("username") != nil {
		c.Redirect("/admin", 302)
	}
	if c.Ctx.Request.Method == "POST" {
		// Check post
		form := formAuth{}
		c.ParseForm(&form)
		// validation
		valid := validation.Validation{}
		pass, _ := valid.Valid(&form)
		errMsg := []string{}
		if !pass {
			// validation does not pass
			for _, err := range valid.Errors {
				errMsg = append(errMsg, fmt.Sprintf("%s: %s", err.Field, err.Message))
			}
			c.Data["errMsg"] = errMsg
		} else {
			// Get username
			user := models.User{
				Username: form.Username,
			}
			if user.Read("username") != nil || helper.CheckPasswordHash(user.Salt+form.Password, user.Hash) != nil {
				// check user name
				errMsg = append(errMsg, "Không tìm thấy người dùng")
			} else if user.Active == 0 {
				// check user active
				errMsg = append(errMsg, "Người dùng đã bị khóa")
			} else {
				user.Update()
				// set sessions
				c.SetSession("username", user.Username)
				c.SetSession("userId", user.Id)
				c.SetSession("roleId", user.RoleID)

				c.Redirect("/admin", 302)
				return
			}

			c.Data["errMsg"] = errMsg
		}
	}
	c.Data["xsrfdata"] = template.HTML(c.XSRFFormHTML())
	c.TplName = "auth/login.html"
}

func (c *AuthController) Logout() {
	c.DestroySession()
	c.Redirect("/login", 302)
}
