package models

import (
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
	dburl := dbuser + ":" + dbpassword + "@tcp(" + dbhost + ":" + dbport + ")/" + dbname + "?charset=utf8&loc=Asia%2FHo_Chi_Minh"
	orm.RegisterDataBase("default", "mysql", dburl)
	// // Set location
	// if beego.AppConfig.String("loc") != "" {
	// 	local, _ := time.LoadLocation(beego.AppConfig.String("loc"))
	// 	orm.SetDataBaseTZ("default", local)
	// }
	// Set prefix db
	if beego.AppConfig.String("dbprefix") != "" {
		orm.RegisterModelWithPrefix(beego.AppConfig.String("dbprefix"), new(User), new(Role), new(Menu), new(Category), new(Product))
	} else {
		orm.RegisterModel(new(User))
	}
	// Log debug db
	if beego.AppConfig.String("runmode") == "dev" {
		orm.Debug = true
	}
}

// TableName return table name
func TableName(str string) string {
	// return fmt.Sprintf("%s%s", beego.AppConfig.String("dbprefix"), str)
	return str
}
