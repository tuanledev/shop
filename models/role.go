package models

import (
	"github.com/astaxie/beego/orm"
)

type Role struct {
	Id       int
	Name     string `form:"name"`
	ModuleID string `orm:"column(module_id)"`
	Detail   string `form:"detail"`
}

// func (m *User) TableName() string {
// 	return TableName("user")
// }

func (m *Role) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *Role) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Role) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Role) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func (m *Role) Query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(m)
}
