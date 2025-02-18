package initialize

import (
	"fmt"
	"go.uber.org/zap"
	"gorm.io/driver/postgres"
	"gorm.io/gen"
	"gorm.io/gorm"
	"server-car-rental-ecommerce-gin/global"
	"time"
)

func checkErrorPanic(err error, errStr string) {
	if err != nil {
		global.Logger.Error(errStr, zap.Error(err))
		panic(fmt.Sprintf("failed to connect database, err: %v", err))
	}
}

func InitMySQL() {
	p := global.Config.PostgreSQL
	dsn := "host=%s port=%d user=%s password=%s dbname=%s sslmode=disable TimeZone=Asia/Ho_Chi_Minh"
	var s = fmt.Sprintf(dsn, p.Host, p.Port, p.Username, p.Password, p.Database)
	db, err := gorm.Open(postgres.Open(s), &gorm.Config{})

	checkErrorPanic(err, "gorm.Open failed")
	global.Logger.Info("postgreSQL connect success")
	global.Mdb = db
	genEntity()
	SetPool()
}

func SetPool() {
	m := global.Config.PostgreSQL
	mysql, err := global.Mdb.DB()
	if err != nil {
		global.Logger.Error("SetPool failed", zap.Error(err))
	}
	mysql.SetMaxIdleConns(int(time.Duration(m.MaxIdleConns)))
	mysql.SetConnMaxLifetime(time.Duration(m.ConnMaxLifetime))
	mysql.SetMaxOpenConns(int(time.Duration(m.MaxOpenConns)))

}

func genEntity() {
	g := gen.NewGenerator(gen.Config{
		OutPath: "./internal/model",
		Mode:    gen.WithoutContext | gen.WithDefaultQuery | gen.WithQueryInterface,
	})
	g.UseDB(global.Mdb)
	g.GenerateAllTable()
	g.Execute()
}
