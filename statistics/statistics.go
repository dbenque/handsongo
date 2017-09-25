package statistics

import (
	"fmt"
	"time"

	logger "github.com/Sirupsen/logrus"
)

const (
	statisticsChannelSize = 1000
)

// Statistics is the worker to persist the request statistics
type Statistics struct {
	statistics    chan uint8
	counter       uint32
	start         time.Time
	loggingPeriod time.Duration
}

// NewStatistics creates a new statistics structure and launches its worker routine
func NewStatistics(loggingPeriod time.Duration) *Statistics {
	// build a new Statistics instance
	sw := Statistics{
		statistics:    make(chan uint8, statisticsChannelSize),
		counter:       0,
		loggingPeriod: loggingPeriod,
	}
	// start the "run" loop in a separate go routine
	go sw.run()
	// return the started instance
	return &sw
}

// PlusOne is used to add one to the counter
func (sw *Statistics) PlusOne() {
	sw.statistics <- uint8(1)
}

func (sw *Statistics) run() {
	// time.NewTicker instance of sw.loggingPeriod duration
	ticker := time.NewTicker(sw.loggingPeriod)
	sw.start = time.Now()

	// infinite loop select for two channel
	for {
		select {

		// process the incoming statistics coming from the channel
		case stat := <-sw.statistics:
			logger.WithField("stat", stat).Debug("new count received")
			sw.counter += uint32(stat)
		case <-ticker.C:
			// compute the time elapsed since the start date
			sinceStart := time.Since(sw.start)
			// compute the request/sec rate
			rate := float64(sw.counter) / sinceStart.Seconds()
			// log the elapsed time, the hit count since last reset
			logger.
				WithField("elapsed time", sinceStart).
				WithField("count", sw.counter).
				WithField("request per second", fmt.Sprintf("%.2f", rate)).
				Warn("request monitoring")

			// reset the counter and the start date
			sw.counter = 0
			sw.start = time.Now()
		}
	}
}
