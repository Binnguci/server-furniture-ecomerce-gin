package setting

type Config struct {
	MySQL  MySQLSetting  `mapstructure:"mysql"`
	Logger LoggerSetting `mapstructure:"log"`
	Redis  RedisSetting  `mapstructure:"redis"`
	Server ServerSetting `mapstructure:"server"`
}

type ServerSetting struct {
	Port int    `mapstructure:"port"`
	Mode string `mapstructure:"mode"`
}

type MySQLSetting struct {
	Host            string `mapstructure:"host"`
	Port            int    `mapstructure:"port"`
	Username        string `mapstructure:"username"`
	Password        string `mapstructure:"password"`
	Database        string `mapstructure:"database"`
	MaxIdleConns    int    `mapstructure:"maxIdleConns"`
	MaxOpenConns    int    `mapstructure:"maxOpenConns"`
	ConnMaxLifetime int    `mapstructure:"connMaxLifetime"`
}

type LoggerSetting struct {
	Level     string `mapstructure:"log_level"`
	Path      string `mapstructure:"log_path"`
	MaxSize   int    `mapstructure:"log_max_size"`
	MaxBackup int    `mapstructure:"log_max_backup"`
	MaxAge    int    `mapstructure:"log_max_age"`
	Compress  bool   `mapstructure:"log_compress"`
}

type RedisSetting struct {
	Host     string `mapstructure:"host"`
	Port     int    `mapstructure:"port"`
	Password string `mapstructure:"password"`
	Database int    `mapstructure:"database"`
	PoolSize int    `mapstructure:"pool_size"`
}
