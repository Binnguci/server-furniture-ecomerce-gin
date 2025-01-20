package logger

import (
	"_server-furniture-ecommerce-gin/pkg/setting"
	"fmt"
	"github.com/natefinch/lumberjack"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
	"os"
	"path/filepath"
	"strings"
)

type LoggerZap struct {
	*zap.Logger
}

func NewLogger(config setting.LoggerSetting) *LoggerZap {
	level := parseLogLevel(config.Level)
	core := getCore(level, config)
	return &LoggerZap{zap.New(core, zap.AddCaller(), zap.AddStacktrace(zapcore.ErrorLevel))}
}

func parseLogLevel(logLevel string) zapcore.Level {
	switch strings.ToLower(logLevel) {
	case "debug":
		return zapcore.DebugLevel
	case "info":
		return zapcore.InfoLevel
	case "warn":
		return zapcore.WarnLevel
	case "error":
		return zapcore.ErrorLevel
	case "dpanic":
		return zapcore.DPanicLevel
	case "panic":
		return zapcore.PanicLevel
	case "fatal":
		return zapcore.FatalLevel
	default:
		return zapcore.InfoLevel
	}
}

func getCore(logLevel zapcore.Level, config setting.LoggerSetting) zapcore.Core {
	encoder := getEncoderLog()
	ensureLogDirExists(config.Path)
	hook := lumberjack.Logger{
		Filename:   config.Path,
		MaxSize:    config.MaxSize,
		MaxBackups: config.MaxBackup,
		MaxAge:     config.MaxAge,
		Compress:   config.Compress,
	}
	sync := zapcore.NewMultiWriteSyncer(zapcore.AddSync(os.Stdout), zapcore.AddSync(&hook))
	return zapcore.NewCore(encoder, sync, logLevel)
}
func ensureLogDirExists(path string) {
	dir := filepath.Dir(path)
	if _, err := os.Stat(dir); os.IsNotExist(err) {
		err := os.MkdirAll(dir, os.ModePerm)
		if err != nil {
			fmt.Println("Failed to create log directory:", err)
		}
	}
}

func getEncoderLog() zapcore.Encoder {
	encoderConfig := zap.NewProductionEncoderConfig()
	//1737216905.3104205 -> 2025-01-18T23:15:05.310+0700
	encoderConfig.EncodeTime = zapcore.ISO8601TimeEncoder
	// ts -> timestamp
	encoderConfig.TimeKey = "timestamp"
	// info -> INFO
	encoderConfig.EncodeLevel = zapcore.CapitalLevelEncoder
	// caller -> file:line
	encoderConfig.EncodeCaller = zapcore.ShortCallerEncoder
	return zapcore.NewJSONEncoder(encoderConfig)
}
