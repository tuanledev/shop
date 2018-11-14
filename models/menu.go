package models

import (
	"github.com/astaxie/beego/orm"
)

type Menu struct {
	Id            int
	TitleVn       string `orm:"column(title_vn) ;form:"titleVn"`
	TitleEn       string `orm:"column(title_en) ;form:"titleEn"`
	AliasVn       string `orm:"column(alias_vn) ;form:"aliasVn"`
	AliasEn       string `orm:"column(alias_en) ;form:"aliasEn"`
	Sort          string `form:"sort"`
	Active        string `form:"active"`
	ParentId      string `orm:"column(parent_id) ;form:"parentId"`
	CateProductId string `orm:"column(cate_product_id) ;form:"cateProductId"`
	CateNewsId    string `orm:"column(cate_news_id) ;form:"cateNewsId"`
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
