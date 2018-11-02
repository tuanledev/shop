package admin

type DashboardController struct {
	baseController
}

func (c *DashboardController) Get() {
	c.display("dashboard")
}
