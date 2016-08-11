package web

import (
	"github.com/Sfeir/handsongo/utils"
	"net/http"
	"time"
)

// StatisticsMiddleware is the middleware to record request statistics
type StatisticsMiddleware struct {
	Stat *utils.Statistics
}

// NewStatisticsMiddleware creates a new statistics middleware
func NewStatisticsMiddleware(duration time.Duration) *StatisticsMiddleware {
	// TODO return a pointer to a new StatisticsMiddleware with a Statistics of duration parameter
	return nil
}

func (sm *StatisticsMiddleware) ServeHTTP(rw http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	// TODO call the PlusOne method and then the next Handler
}
