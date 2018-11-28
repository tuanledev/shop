package models

import (
	"github.com/astaxie/beego/orm"
)

type CateImage struct {
	Id              int    `form:"id"`
	TitleVN         string `orm:"column(title_vn)" form:"TitleVN" valid:"Required"`
	TitleEN         string `orm:"column(title_en)" form:"TitleEN" valid:"Required"`
	DescriptionVN   string `orm:"column(description_vn)" form:"DescriptionVN"`
	DescriptionEN   string `orm:"column(description_en)" form:"DescriptionEN"`
	Sort            int    `form:"Sort"`
	ParentID        int    `orm:"column(parent_id)" form:"ParentID"`
	AliasVN         string `orm:"column(alias_vn)" form:"AliasVN"`
	AliasEN         string `orm:"column(alias_en)" form:"AliasEN"`
	MetaKeyword     string `orm:"column(meta_keyword)" form:"MetaKeyword"`
	MetaDescription string `orm:"column(meta_description)" form:"MetaDescription"`
	Link            string `form:"Link"`
	Images          string `form:"Images"`
	Style           string `form:"Style"`
	NameParentID    string `orm:"-"`
}

func (m *CateImage) TableName() string {
	return TableName("cate_image")
}

func (m *CateImage) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *CateImage) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *CateImage) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *CateImage) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func (m *CateImage) Query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(m)
}
