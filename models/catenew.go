package models

import (
	"github.com/astaxie/beego/orm"
)

type CateNew struct {
	Id                int    `form:"id"`
	TitleVN           string `orm:"column(title_vn)" form:"TitleVN" valid:"Required"`
	TitleEN           string `orm:"column(title_en)" form:"TitleEN" valid:"Required"`
	DescriptionVN     string `orm:"column(description_vn)" form:"DescriptionVN"`
	DescriptionEN     string `orm:"column(description_en)" form:"DescriptionEN"`
	Sort              int    `form:"Sort"`
	ParentID          int    `orm:"column(parent_id)" form:"ParentID"`
	AliasVN           string `orm:"column(alias_vn)" form:"AliasVN"`
	AliasEN           string `orm:"column(alias_en)" form:"AliasEN"`
	MetaKeywordVN     string `orm:"column(meta_keyword_vn)" form:"MetaKeywordVN"`
	MetaKeywordEN     string `orm:"column(meta_keyword_en)" form:"MetaKeywordEN"`
	MetaDescriptionVN string `orm:"column(meta_description_vn)" form:"MetaDescriptionVN"`
	MetaDescriptionEN string `orm:"column(meta_description_en)" form:"MetaDescriptionEN"`
	Tag               string `form:"Tag"`
	Footer            string `form:"Footer"`
	Images            string `form:"Images"`
	NameParentID      string `orm:"-"`
}

func (m *CateNew) TableName() string {
	return TableName("catenews")
}

func (m *CateNew) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *CateNew) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *CateNew) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *CateNew) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func (m *CateNew) Query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(m)
}
