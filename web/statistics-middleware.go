package web

import (
	"net/http"
	"time"

	"github.com/Sfeir/handsongo/statistics"
)

// StatisticsMiddleware is the middleware to record request statistics
type StatisticsMiddleware struct {
	Stat *statistics.Statistics
}

// NewStatisticsMiddleware creates a new statistics middleware
func NewStatisticsMiddleware(duration time.Duration) *StatisticsMiddleware {
	return &StatisticsMiddleware{
		Stat: statistics.NewStatistics(duration),
	}
}

func (sm *StatisticsMiddleware) ServeHTTP(rw http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	// call the PlusOne method and then the next Handler
	sm.Stat.PlusOne()
}
