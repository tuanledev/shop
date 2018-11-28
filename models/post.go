package models

import (
	"time"

	"github.com/astaxie/beego/orm"
)

type Post struct {
	Id                int       `form:"id"`
	TitleVN           string    `orm:"column(title_vn)" form:"TitleVN" valid:"Required"`
	TitleEN           string    `orm:"column(title_en)" form:"TitleEN" valid:"Required"`
	DescriptionVN     string    `orm:"column(description_vn)" form:"DescriptionVN"`
	DescriptionEN     string    `orm:"column(description_en)" form:"DescriptionEN"`
	ContentVN         string    `orm:"column(content_vn)" form:"ContentVN"`
	ContentEN         string    `orm:"column(content_en)" form:"ContentEN"`
	CategoryID        int       `orm:"column(id_category)" form:"CategoryID"`
	Images            string    `orm:"column(images)" form:"Images"`
	Sort              int       `form:"Sort"`
	Hot               int       `form:"Hot"`
	New               int       `form:"New"`
	AliasVN           string    `orm:"column(alias_vn)" form:"AliasVN"`
	AliasEN           string    `orm:"column(alias_en)" form:"AliasEN"`
	Create            time.Time `orm:"auto_now_add;type(datetime)"`
	MetaKeywordVN     string    `orm:"column(meta_keyword_vn)" form:"MetaKeywordVN"`
	MetaKeywordEN     string    `orm:"column(meta_keyword_en)" form:"MetaKeywordEN"`
	MetaDescriptionVN string    `orm:"column(meta_description_vn)" form:"MetaDescriptionVN"`
	MetaDescriptionEN string    `orm:"column(meta_description_en)" form:"MetaDescriptionEN"`
	Tag               string    `form:"Tag"`
	NameCategoryID    string    `orm:"-"`
}

func (m *Post) TableName() string {
	return TableName("post")
}

func (m *Post) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *Post) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Post) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Post) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func (m *Post) Query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(m)
}
