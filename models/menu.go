package models

import (
	"github.com/astaxie/beego/orm"
)

type Menu struct {
	Id            int    `form:"id"`
	TitleVN       string `orm:"column(title_vn)" form:"TitleVN" valid:"Required"`
	TitleEN       string `orm:"column(title_en)" form:"TitleEN" valid:"Required"`
	AliasVN       string `orm:"column(alias_vn)" form:"AliasVN"`
	AliasEN       string `orm:"column(alias_en)" form:"AliasEN"`
	Sort          int    `form:"Sort"`
	Active        int    `form:"Active"`
	ParentID      int    `orm:"column(parent_id)" form:"ParentID"`
	CateProductID int    `orm:"column(cate_product_id)" form:"CateProductID"`
	CateNewsID    int    `orm:"column(cate_news_id)" form:"CateNewsID"`
	PostID        int    `orm:"column(post_id)" form:"PostID"`
	NameParentID  string `orm:"-"`
	NameProductID string `orm:"-"`
	NameNewsID    string `orm:"-"`
	NamePostID    string `orm:"-"`
	UrlVN         string `orm:"column(url_vn)"`
	UrlEN         string `orm:"column(url_en)"`
}

func (m *Menu) TableName() string {
	return TableName("menu")
}

func (m *Menu) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *Menu) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Menu) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Menu) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func (m *Menu) Query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(m)
}
