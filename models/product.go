package models

import (
	"time"

	"github.com/astaxie/beego/orm"
)

type Product struct {
	Id                int       `form:"id"`
	TitleVN           string    `orm:"column(title_vn)" form:"TitleVN" valid:"Required"`
	TitleEN           string    `orm:"column(title_en)" form:"TitleEN" valid:"Required"`
	DescriptionVN     string    `orm:"column(description_vn)" form:"DescriptionVN"`
	DescriptionEN     string    `orm:"column(description_en)" form:"DescriptionEN"`
	ContentVN         string    `orm:"column(content_vn)" form:"ContentVN"`
	ContentEN         string    `orm:"column(content_en)" form:"ContentEN"`
	CategoryID        int       `orm:"column(id_category)" form:"CategoryID"`
	Images            string    `orm:"column(images)" form:"Images"`
	Images1           string    `orm:"column(images1)" form:"Images1"`
	Images2           string    `orm:"column(images2)" form:"Images2"`
	Images3           string    `orm:"column(images3)" form:"Images3"`
	Images4           string    `orm:"column(images4)" form:"Images4"`
	Images5           string    `orm:"column(images5)" form:"Images5"`
	Price             int       `orm:"column(price)" form:"Price"`
	SalePrice         int       `orm:"column(sale_price)" form:"SalePrice"`
	Sort              int       `form:"Sort"`
	Hot               int       `form:"Hot"`
	Order             int       `form:"Order"`
	New               int       `form:"New"`
	AliasVN           string    `orm:"column(alias_vn)" form:"AliasVN"`
	AliasEN           string    `orm:"column(alias_en)" form:"AliasEN"`
	Create            time.Time `orm:"auto_now_add;type(datetime)"`
	MetaKeywordVN     string    `orm:"column(meta_keyword_vn)" form:"MetaKeywordVN"`
	MetaKeywordEN     string    `orm:"column(meta_keyword_en)" form:"MetaKeywordEN"`
	MetaDescriptionVN string    `orm:"column(meta_description_vn)" form:"MetaDescriptionVN"`
	MetaDescriptionEN string    `orm:"column(meta_description_en)" form:"MetaDescriptionEN"`
	NameCategoryID    string    `orm:"-"`
	PriceStr          string    `orm:"-"`
	SalePriceStr      string    `orm:"-"`
}

func (m *Product) TableName() string {
	return TableName("product")
}

func (m *Product) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *Product) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Product) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Product) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func (m *Product) Query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(m)
}
