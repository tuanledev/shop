package admin

type UsersController struct {
	baseController
}

func (c *UsersController) List() {
	c.Data["Website"] = "tuanle123"
	c.Data["Email"] = "tuanle123@gmail.com"
	c.display()
}
