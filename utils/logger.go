package utils

import (
	"github.com/Sirupsen/logrus"
	"github.com/bshuster-repo/logrus-logstash-hook"
	"time"
)

const (
	// LogStashFormatter is constant used to format logs as logstash format
	LogStashFormatter = "logstash"
	// TextFormatter is constant used to format logs as simple text format
	TextFormatter = "text"
)

// InitLog initializes the logrus logger
func InitLog(logLevel, formatter string) error {

	// TODO depending on formatter param, initialize the logrus logger as the logstash one
	switch formatter {
	case LogStashFormatter:
		logrus.SetFormatter(&logrus_logstash.LogstashFormatter{
			TimestampFormat: time.RFC3339,
		})
	default:
		// TODO set the TextFormatter with forced color in output and full timestamp
	}

	// TODO set the logger output to os.Stdout instead of os.Stderr by default

	// TODO parse the logLevel attribute
	// in case of error set the logger level to logrus.DebugLevel and return the error

	// TODO if ok set the parsed level to the logger
	return nil
}
