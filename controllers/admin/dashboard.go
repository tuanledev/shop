package admin

type DashboardController struct {
	baseController
}

func (c *DashboardController) Get() {
	c.Data["Website"] = "tuanle123"
	c.Data["Email"] = "tuanle123@gmail.com"
	c.display()
}
