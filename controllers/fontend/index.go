package fontend

import "fmt"

type IndexController struct {
	baseController
}

func (c *IndexController) Index() {
	fmt.Println("--------------------------")
	c.setHeadMetas("ok", "ok", "123")
	c.display("index.html")
}
