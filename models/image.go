package models

import (
	"github.com/astaxie/beego/orm"
)

type Image struct {
	Id              int    `form:"id"`
	TitleVN         string `orm:"column(title_vn)" form:"TitleVN" valid:"Required"`
	TitleEN         string `orm:"column(title_en)" form:"TitleEN" valid:"Required"`
	DescriptionVN   string `orm:"column(description_vn)" form:"DescriptionVN"`
	DescriptionEN   string `orm:"column(description_en)" form:"DescriptionEN"`
	Images          string `orm:"column(images)" form:"Images"`
	Sort            int    `form:"Sort"`
	ParentID        int    `orm:"column(parent_id)" form:"ParentID"`
	AliasVN         string `orm:"column(alias_vn)" form:"AliasVN"`
	AliasEN         string `orm:"column(alias_en)" form:"AliasEN"`
	MetaKeyword     string `orm:"column(meta_keyword)" form:"MetaKeyword"`
	MetaDescription string `orm:"column(meta_description)" form:"MetaDescription"`
	NameParentID    string `orm:"-"`
}

func (m *Image) TableName() string {
	return TableName("cate_images")
}

func (m *Image) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *Image) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Image) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Image) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func (m *Image) Query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(m)
}
