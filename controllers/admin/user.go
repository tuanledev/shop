package admin

import (
	"shop/helper"
	"shop/models"
	"time"
)

type UserController struct {
	baseController
}

func (c *UserController) List() {
	c.Data["Website"] = "tuanle123"
	c.Data["Email"] = "tuanle123@gmail.com"
	c.display()
}

func (c *UserController) Create() {
	user := models.User{}
	if salt, err := helper.HashPassword(time.Now().String() + user.Username); err == nil {
		user.Salt = salt
	}
	if hash, err := helper.HashPassword(user.Salt); err == nil {
		user.Hash = hash
	}
	user.Insert()
	c.StopRun()
}
