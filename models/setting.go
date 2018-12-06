package models

import (
	"github.com/astaxie/beego/orm"
)

type Setting struct {
	Id              int    `form:"id"`
	TitleVN         string `orm:"column(title_vn)" form:"TitleVN" valid:"Required"`
	TitleEN         string `orm:"column(title_en)" form:"TitleEN" valid:"Required"`
	DescriptionVN   string `orm:"column(description_vn)" form:"DescriptionVN"`
	DescriptionEN   string `orm:"column(description_en)" form:"DescriptionEN"`
	KeywordVN       string `orm:"column(keyword_vn)" form:"KeywordVN"`
	KeywordEN       string `orm:"column(keyword_en)" form:"KeywordEN"`
	Googleanalytics string `form:"Googleanalytics"`
	Email           string `form:"Email"`
	Hotline         string `form:"Hotline"`
	Hotline2        string `form:"Hotline2"`
	Fanpage         string `form:"Fanpage"`
	Zalo            string `form:"Zalo"`
	Youtube         string `form:"Youtube"`
	Twitter         string `form:"Twitter"`
	Google          string `form:"Google"`
	Instagram       string `form:"Instagram"`
	Address         string `form:"Address"`
	Company         string `form:"Company"`
	Slogan          string `form:"Slogan"`
	Logo            string `form:"Logo"`
	Icon            string `form:"Icon"`
	Footer          string `form:"Footer"`
	MetaFB          string `orm:"column(meta_fb)" form:"MetaFB"`
}

func (m *Setting) TableName() string {
	return TableName("setting")
}

func (m *Setting) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *Setting) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Setting) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Setting) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func (m *Setting) Query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(m)
}
