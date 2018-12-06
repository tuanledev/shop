package models

import (
	"github.com/astaxie/beego/orm"
)

type Contact struct {
	Id      int    `form:"id"`
	Name    string ` form:"Name"`
	Phone   string ` form:"Phone"`
	Address string ` form:"Address"`
	Email   string ` form:"Email"`
	Message string ` form:"Message"`
}

func (m *Contact) TableName() string {
	return TableName("contact")
}

func (m *Contact) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *Contact) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Contact) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Contact) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func (m *Contact) Query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(m)
}
