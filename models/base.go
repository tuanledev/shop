package models

import (
	"fmt"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

func init() {
	dbhost := beego.AppConfig.String("mysqlurls")
	dbport := beego.AppConfig.String("mysqlport")
	dbuser := beego.AppConfig.String("mysqluser")
	dbpassword := beego.AppConfig.String("mysqlpass")
	dbname := beego.AppConfig.String("mysqldb")
	dburl := dbuser + ":" + dbpassword + "@tcp(" + dbhost + ":" + dbport + ")/" + dbname + "?charset=utf8"
	orm.RegisterDataBase("default", "mysql", dburl)
	// orm.RegisterModelWithPrefix()
	if beego.AppConfig.String("runmode") == "dev" {
		orm.Debug = true
	}
}

// TableName return table name
func TableName(str string) string {
	return fmt.Sprintf("%s%s", beego.AppConfig.String("dbprefix"), str)
}