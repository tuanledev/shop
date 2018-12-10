package frontend

import (
	"fmt"
	"shop/helper"
	"shop/models"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/utils/pagination"
	"github.com/dustin/go-humanize"
)

type IndexController struct {
	baseController
}

func (c *IndexController) Index() {
	post := models.Post{}
	posts := []models.Post{}
	switch c.Lang {
	case "en-US":
		post.Query().Filter("hot", 1).OrderBy("sort").Limit(5).All(&posts, "id", "title_en", "description_en", "images", "alias_en")
		c.setHeadMetas(c.setting.TitleEN, c.setting.KeywordEN, c.setting.DescriptionEN)
	default:
		post.Query().Filter("hot", 1).OrderBy("sort").Limit(5).All(&posts, "id", "title_vn", "description_vn", "images", "alias_vn")
		c.setHeadMetas(c.setting.TitleVN, c.setting.KeywordVN, c.setting.DescriptionVN)
	}
	c.Data["data"] = posts
	c.display("index.html")
}

func (c *IndexController) SetLang() {
	// if c.IsAjax() {
	lang := c.GetString("lang")
	fmt.Println("lang ", lang)
	res := make(map[string]interface{})
	switch lang {
	case "en-US":
		c.Ctx.SetCookie("lang", "en-US", helper.TimeYear)
		res["lang"] = "en"
		res["redirect"] = true
	// case "vi-VN":
	// 	c.Ctx.SetCookie("lang", "vi-VN")
	// 	res["lang"] = "vi-VN"
	// 	res["redirect"] = true
	default:
		c.Ctx.SetCookie("lang", "vi-VN", helper.TimeYear)
		res["lang"] = "vi"
		res["redirect"] = true
	}
	// }
	c.Data["json"] = res
	c.ServeJSON()
}

func (c *IndexController) About() {
	post := models.Post{}
	switch c.Lang {
	case "en-US":
		post.Query().Filter("id", 196).One(&post, "id", "title_en", "content_en", "images", "alias_en", "meta_keyword_en", "meta_description_en")
		c.setHeadMetas(post.TitleVN, post.MetaKeywordEN, post.MetaDescriptionEN)
	default:
		post.Query().Filter("id", 196).One(&post, "id", "title_vn", "content_vn", "images", "alias_vn", "meta_keyword_vn", "meta_description_vn")
		c.setHeadMetas(post.TitleVN, post.MetaKeywordVN, post.MetaDescriptionVN)
	}
	c.Data["data"] = post
	c.display("post_detail.html")
}

func (c *IndexController) Contact() {
	if c.Ctx.Input.Method() == "POST" {
		contact := models.Contact{}
		c.ParseForm(&contact)
		dataRes := make(map[string]interface{})
		if contact.Insert() == nil {
			go func(contact models.Contact) {
				email := helper.Email{}
				email.To = append(email.To, beego.AppConfig.String("mail_to"))
				email.Subject = "Thông tin liên hệ từ webstite"
				fmt.Println("contact ----------------------------", contact.Name, contact.Email, contact.Phone, contact.Address, contact.Message)
				email.Body = `
				<table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:separate;" align="center" border="0">
					<tbody>
						<tr>
							<td style="border:1px solid #353535;border-radius:5px;color:#fff;cursor:auto;padding:15px 30px;" align="center"
								valign="middle" bgcolor="#505050">
								<p style="text-decoration:none;line-height:100%;background:#505050;color:white;font-family:Helvetica, Arial, sans-serif;font-size:16px;font-weight:bold;text-transform:none;margin:0px;">
									Họ tên: <b>` + contact.Name + `</b> <br>
									Email: <b>` + contact.Email + `</b> <br>
									Sđt: ` + contact.Phone + ` <br>
									Địa chỉ: ` + contact.Address + ` <br>
									Lời nhắn: ` + contact.Message + ` 
								</p>
							</td>
						</tr>
					</tbody>
				</table>`
				email.Send()
			}(contact)
			switch c.Lang {
			case "en-US":
				dataRes["status"] = true
				dataRes["msg"] = "Send Success"
			default:
				dataRes["status"] = true
				dataRes["msg"] = "Gửi thành công"
			}
			c.Data["json"] = dataRes
			c.ServeJSON()
		} else {
			switch c.Lang {
			case "en-US":
				dataRes["status"] = false
				dataRes["msg"] = "Send Error"
			default:
				dataRes["status"] = false
				dataRes["msg"] = "Gửi thất bại"
			}
			c.Data["json"] = dataRes
			c.ServeJSON()
		}
	}
	post := models.Post{}
	switch c.Lang {
	case "en-US":
		post.Query().Filter("id", 197).One(&post, "id", "title_en", "content_en", "images", "alias_en", "description_en", "meta_keyword_en", "meta_description_en")
		c.setHeadMetas(post.TitleVN, post.MetaKeywordEN, post.MetaDescriptionEN)
	default:
		post.Query().Filter("id", 197).One(&post, "id", "title_vn", "content_vn", "images", "alias_vn", "description_vn", "meta_keyword_vn", "meta_description_vn")
		c.setHeadMetas(post.TitleVN, post.MetaKeywordVN, post.MetaDescriptionVN)
	}
	c.Data["data"] = post
	c.Data["xsrf_token"] = c.XSRFToken()
	c.display("contact.html")
	c.setHeadMetas(post.TitleVN, post.MetaKeywordVN, post.MetaDescriptionVN)
	c.LayoutSections["Script"] = "frontend/script/contact.html"
}

func (c *IndexController) Search() {
	post := models.Product{}
	posts := []models.Product{}
	search := c.GetString("s")
	c.Data["search_key"] = search
	search = helper.StrToAlias(search)
	// pagination
	postsPerPage := 9
	switch c.Lang {
	case "en-US":
		countPost, err := post.Query().Filter("alias_en__icontains", search).Count()
		if err != nil {
			c.Redirect("/", 302)
		}
		paginator := pagination.SetPaginator(c.Ctx, postsPerPage, countPost)
		post.Query().Filter("alias_en__icontains", search).Limit(postsPerPage, paginator.Offset()).All(&posts, "id", "title_en", "description_en", "images", "alias_en", "price")
		c.setHeadMetas("Search", "Search", "Search")
		c.Data["paginator"] = paginator
	default:
		countPost, err := post.Query().Filter("alias_vn__icontains", search).Count()
		if err != nil {
			c.Redirect("/", 302)
		}
		paginator := pagination.SetPaginator(c.Ctx, postsPerPage, countPost)
		post.Query().Filter("alias_vn__icontains", search).Limit(postsPerPage, paginator.Offset()).All(&posts, "id", "title_vn", "description_vn", "images", "alias_vn", "price")
		c.setHeadMetas("Tìm kiếm", "Tìm kiếm", "Tìm kiếm")
		c.Data["paginator"] = paginator
	}
	if len(posts) > 0 {
		c.Data["images"] = posts[0].Images
		for i, product := range posts {
			posts[i].SalePriceStr = humanize.Comma(int64(product.SalePrice))
			posts[i].PriceStr = humanize.Comma(int64(product.Price))
		}
	}
	c.Data["data"] = posts
	c.display("search.html")
}
