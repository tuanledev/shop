package models

import (
	"time"

	"github.com/astaxie/beego/orm"
)

type User struct {
	Id        int
	Username  string `orm:"unique;size(50)" form:"username"`
	Hash      string
	Email     string `form:"email"`
	RoleID    int    `orm:"column(role_id)" form:"role"`
	Salt      string
	Create    time.Time `orm:"auto_now_add;type(datetime)"`
	LastLogin time.Time `orm:"auto_now;type(datetime);column(last_login)"`
	Fullname  string    `form:"fullname"`
	Address   string    `form:"address"`
	Active    int       `orm:"default(1)" form:"active"`
	Password  string    `orm:"-" form:"password"`
}

// func (m *User) TableName() string {
// 	return TableName("user")
// }

func (m *User) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *User) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *User) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *User) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func (m *User) Query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(m)
}
