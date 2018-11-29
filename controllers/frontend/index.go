package frontend

import "fmt"

type IndexController struct {
	baseController
}

func (c *IndexController) Index() {
	fmt.Println("--------------------------", c.Lang)
	c.setHeadMetas("ok", "ok", "123")
	c.display("index.html")
}
