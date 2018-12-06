package frontend

import (
	"shop/helper"
	"shop/models"
	"strconv"

	"github.com/astaxie/beego/orm"
	"github.com/astaxie/beego/utils/pagination"
)

type PostController struct {
	baseController
}

func (c *PostController) Detail() {
	// 1. Check URL arguments.
	urlName := c.Ctx.Input.Param(":urlname")
	id := helper.ParseUrl(urlName)
	if id <= 0 {
		c.Redirect("/", 302)
	}
	post := models.Post{}
	switch c.Lang {
	case "en-US":
		if post.Query().Filter("id", id).One(&post, "title_en", "content_en", "meta_keyword_en", "meta_description_en", "images") != nil {
			c.Redirect("/", 302)
		}
		c.setHeadMetas(post.TitleEN, post.MetaKeywordEN, post.MetaDescriptionEN)
	default:
		if post.Query().Filter("id", id).One(&post, "title_vn", "content_vn", "meta_keyword_vn", "meta_description_vn", "images") != nil {
			c.Redirect("/", 302)
		}
		c.setHeadMetas(post.TitleVN, post.MetaKeywordVN, post.MetaDescriptionVN)
	}
	c.Data["data"] = post
	c.display("post_detail.html")
}

func (c *PostController) Category() {
	// 1. Check URL arguments.
	idcate := c.Ctx.Input.Param(":idcate")
	id, _ := strconv.Atoi(idcate)
	if id <= 0 {
		c.Redirect("/", 302)
	}
	post := models.Post{}
	posts := []models.Post{}
	// pagination
	postsPerPage := 6
	countPost, err := post.Query().Filter("id_category", id).Count()
	if err != nil {
		c.Redirect("/", 302)
	}
	paginator := pagination.SetPaginator(c.Ctx, postsPerPage, countPost)
	// get name category
	category := models.CateNew{}
	switch c.Lang {
	case "en-US":
		if _, err := post.Query().Filter("id_category", id).Limit(postsPerPage, paginator.Offset()).All(&posts, "id", "title_en", "description_en", "images", "alias_en"); err != nil {
			c.Redirect("/", 302)
		}
		category.Query().Filter("id", id).One(&category, "title_en", "meta_keyword_en", "meta_description_en", "images")
		c.setHeadMetas(category.TitleEN, category.MetaKeywordEN, category.MetaDescriptionEN)
	default:
		if _, err := post.Query().Filter("id_category", id).Limit(postsPerPage, paginator.Offset()).All(&posts, "id", "title_vn", "description_vn", "images", "alias_vn"); err != nil {
			c.Redirect("/", 302)
		}
		category.Query().Filter("id", id).One(&category, "title_vn", "meta_keyword_vn", "meta_description_vn", "images")
		c.setHeadMetas(category.TitleVN, category.MetaKeywordVN, category.MetaDescriptionVN)
	}
	c.Data["data"] = posts
	c.Data["paginator"] = paginator
	c.Data["category_news"] = category
	c.display("post_cate.html")
}

func (c *PostController) CategoryAll() {
	// 1. Check URL arguments.
	post := models.Post{}
	posts := []models.Post{}
	// pagination
	postsPerPage := 6
	cond := orm.NewCondition().OrNot("id__in", 196, 197)
	countPost, err := post.Query().SetCond(cond).Count()
	if err != nil {
		c.Redirect("/", 302)
	}
	paginator := pagination.SetPaginator(c.Ctx, postsPerPage, countPost)
	switch c.Lang {
	case "en-US":
		if _, err := post.Query().SetCond(cond).OrderBy("-id").Limit(postsPerPage, paginator.Offset()).All(&posts, "id", "title_en", "description_en", "images", "alias_en"); err != nil {
			c.Redirect("/", 302)
		}
		if len(posts) > 0 {
			c.setHeadMetas(posts[0].TitleEN, posts[0].MetaKeywordEN, posts[0].MetaDescriptionEN)
		}
	default:
		if _, err := post.Query().SetCond(cond).OrderBy("-id").Limit(postsPerPage, paginator.Offset()).All(&posts, "id", "title_vn", "description_vn", "images", "alias_vn"); err != nil {
			c.Redirect("/", 302)
		}
		if len(posts) > 0 {
			c.setHeadMetas(posts[0].TitleVN, posts[0].MetaKeywordVN, posts[0].MetaDescriptionVN)
		}
	}
	c.Data["data"] = posts
	c.Data["paginator"] = paginator
	c.display("post_cate.html")
}
