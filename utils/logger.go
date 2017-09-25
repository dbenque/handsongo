package utils

import (
	"os"
	"time"

	"github.com/Sirupsen/logrus"
	"github.com/bshuster-repo/logrus-logstash-hook"
)

const (
	// LogStashFormatter is constant used to format logs as logstash format
	LogStashFormatter = "logstash"
	// TextFormatter is constant used to format logs as simple text format
	TextFormatter = "text"
)

// InitLog initializes the logrus logger
func InitLog(logLevel, formatter string) error {

	switch formatter {
	case LogStashFormatter:
		logrus.SetFormatter(&logrus_logstash.LogstashFormatter{
			TimestampFormat: time.RFC3339,
		})
	default:
		logrus.SetFormatter(&logrus.TextFormatter{
			ForceColors:   true,
			FullTimestamp: true,
		})
	}

	// set the logger output to os.Stdout instead of os.Stderr by default
	logrus.SetOutput(os.Stdout)

	// parse the logLevel attribute
	// in case of error set the logger level to logrus.DebugLevel and return the error
	// if ok set the parsed level to the logger
	level, err := logrus.ParseLevel(logLevel)
	if err != nil {
		logrus.SetLevel(logrus.DebugLevel)
		return err
	}
	logrus.SetLevel(level)
	return nil
}
