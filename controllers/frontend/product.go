package frontend

import (
	"shop/helper"
	"shop/models"
	"strconv"

	"github.com/astaxie/beego/utils/pagination"
	"github.com/dustin/go-humanize"
)

type ProductController struct {
	baseController
}

func (c *ProductController) Detail() {
	// 1. Check URL arguments.
	urlName := c.Ctx.Input.Param(":urlname")
	id := helper.ParseUrl(urlName)
	if id <= 0 {
		c.Redirect("/", 302)
	}
	post := models.Product{}
	switch c.Lang {
	case "en-US":
		if post.Query().Filter("id", id).One(&post, "title_en", "content_en", "meta_keyword_en", "meta_description_en", "images", "price") != nil {
			c.Redirect("/", 302)
		}
		c.setHeadMetas(post.TitleEN, post.MetaKeywordEN, post.MetaDescriptionEN)
	default:
		if post.Query().Filter("id", id).One(&post, "title_vn", "content_vn", "meta_keyword_vn", "meta_description_vn", "images", "price") != nil {
			c.Redirect("/", 302)
		}
		c.setHeadMetas(post.TitleVN, post.MetaKeywordVN, post.MetaDescriptionVN)
	}
	post.SalePriceStr = humanize.Comma(int64(post.SalePrice))
	post.PriceStr = humanize.Comma(int64(post.Price))
	c.Data["data"] = post
	c.display("product_detail.html")
}

func (c *ProductController) Category() {
	// 1. Check URL arguments.
	idcate := c.Ctx.Input.Param(":idcate")
	id, _ := strconv.Atoi(idcate)
	if id <= 0 {
		c.Redirect("/", 302)
	}
	post := models.Product{}
	posts := []models.Product{}
	// pagination
	postsPerPage := 9
	countPost, err := post.Query().Filter("id_category", id).Count()
	if err != nil {
		c.Redirect("/", 302)
	}
	paginator := pagination.SetPaginator(c.Ctx, postsPerPage, countPost)
	// get name category
	category := models.Category{}
	switch c.Lang {
	case "en-US":
		if _, err := post.Query().Filter("id_category", id).Limit(postsPerPage, paginator.Offset()).All(&posts, "id", "title_en", "description_en", "images", "alias_en", "price"); err != nil {
			c.Redirect("/", 302)
		}
		category.Query().Filter("id", id).One(&category, "title_en", "meta_keyword_en", "meta_description_en", "images")
		c.setHeadMetas(category.TitleEN, category.MetaKeywordEN, category.MetaDescriptionEN)
	default:
		if _, err := post.Query().Filter("id_category", id).Limit(postsPerPage, paginator.Offset()).All(&posts, "id", "title_vn", "description_vn", "images", "alias_vn", "price"); err != nil {
			c.Redirect("/", 302)
		}
		category.Query().Filter("id", id).One(&category, "title_vn", "meta_keyword_vn", "meta_description_vn", "images")
		c.setHeadMetas(category.TitleVN, category.MetaKeywordVN, category.MetaDescriptionVN)
	}
	for i, product := range posts {
		posts[i].SalePriceStr = humanize.Comma(int64(product.SalePrice))
		posts[i].PriceStr = humanize.Comma(int64(product.Price))
	}
	c.Data["data"] = posts
	c.Data["category_product"] = category
	c.Data["paginator"] = paginator
	c.display("product_cate.html")
}

func (c *ProductController) CategoryAll() {
	// 1. Check URL arguments.
	post := models.Product{}
	posts := []models.Product{}
	// pagination
	postsPerPage := 9
	countPost, err := post.Query().Count()
	if err != nil {
		c.Redirect("/", 302)
	}
	paginator := pagination.SetPaginator(c.Ctx, postsPerPage, countPost)
	switch c.Lang {
	case "en-US":
		if _, err := post.Query().OrderBy("-id").Limit(postsPerPage, paginator.Offset()).All(&posts, "id", "title_en", "description_en", "images", "alias_en", "price"); err != nil {
			c.Redirect("/", 302)
		}
		if len(posts) > 0 {
			c.setHeadMetas(posts[0].TitleEN, posts[0].MetaKeywordEN, posts[0].MetaDescriptionEN)
		}
	default:
		if _, err := post.Query().OrderBy("-id").Limit(postsPerPage, paginator.Offset()).All(&posts, "id", "title_vn", "description_vn", "images", "alias_vn", "price"); err != nil {
			c.Redirect("/", 302)
		}
		if len(posts) > 0 {
			c.setHeadMetas(posts[0].TitleVN, posts[0].MetaKeywordVN, posts[0].MetaDescriptionVN)
		}
	}
	for i, product := range posts {
		posts[i].SalePriceStr = humanize.Comma(int64(product.SalePrice))
		posts[i].PriceStr = humanize.Comma(int64(product.Price))
	}
	c.Data["data"] = posts
	c.Data["paginator"] = paginator
	c.display("product_cate.html")
}
