package models

import (
	"time"

	"github.com/astaxie/beego/orm"
)

type Image struct {
	Id         int       `form:"id"`
	Images     string    `form:"Images"`
	CateID     int       `orm:"column(cate_id)" form:"CateID"`
	Sort       int       `form:"Sort"`
	Date       time.Time `orm:"auto_now_add;type(datetime)"`
	NameCateID string    `orm:"-"`
}

func (m *Image) TableName() string {
	return TableName("image")
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
