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

func InitPostgreSQL() {
	p := global.Config.PostgreSQL
	dsn := "host=%s port=%d user=%s password=%s dbname=%s sslmode=disable TimeZone=Asia/Ho_Chi_Minh"
	var s = fmt.Sprintf(dsn, p.Host, p.Port, p.Username, p.Password, p.Database)
	db, err := gorm.Open(postgres.Open(s), &gorm.Config{})

	checkErrorPanic(err, "gorm.Open failed")
	global.Logger.Info("postgreSQL connect success")
	global.Pdb = db
	//genEntity()
	SetPool()
}

func SetPool() {
	p := global.Config.PostgreSQL
	postgres, err := global.Pdb.DB()
	if err != nil {
		global.Logger.Error("SetPool failed", zap.Error(err))
	}
	postgres.SetMaxIdleConns(int(time.Duration(p.MaxIdleConns)))
	postgres.SetConnMaxLifetime(time.Duration(p.ConnMaxLifetime))
	postgres.SetMaxOpenConns(int(time.Duration(p.MaxOpenConns)))

}

func genEntity() {
	g := gen.NewGenerator(gen.Config{
		OutPath: "./internal/model",
		Mode:    gen.WithoutContext | gen.WithDefaultQuery | gen.WithQueryInterface,
	})
	g.UseDB(global.Pdb)
	g.GenerateAllTable()
	g.Execute()
}
