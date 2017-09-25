package dao

import (
	"time"

	"github.com/Sfeir/handsongo/model"
	"gopkg.in/mgo.v2/bson"
)

// safety check
var _ SpiritDAO = (*SpiritDAOMock)(nil)

// MockedSpirit is the spirit returned by this mocked interface
var MockedSpirit = model.Spirit{
	ID:           bson.NewObjectId(),
	Name:         "Caroni",
	Distiller:    "Caroni",
	Bottler:      "Velier",
	Country:      "Trinidad",
	Composition:  "Molasse",
	SpiritType:   model.TypeRhum,
	Age:          5,
	BottlingDate: time.Date(2017, 9, 27, 18, 30, 00, 0, time.UTC),
	Score:        8.5,
	Comment:      "heavy tire taste",
}

// SpiritDAOMock is the mocked implementation of the SpiritDAO
type SpiritDAOMock struct {
}

// NewSpiritDAOMock creates a new SpiritDAO with a mocked implementation
func NewSpiritDAOMock() SpiritDAO {
	return &SpiritDAOMock{}
}

// GetSpiritByID returns a spirit by its ID
func (s *SpiritDAOMock) GetSpiritByID(ID string) (*model.Spirit, error) {
	return &MockedSpirit, nil
}

// GetAllSpirits returns all spirits with paging capability
func (s *SpiritDAOMock) GetAllSpirits(start, end int) ([]model.Spirit, error) {
	return []model.Spirit{MockedSpirit}, nil
}

// GetSpiritsByName returns all spirits by name
func (s *SpiritDAOMock) GetSpiritsByName(name string) ([]model.Spirit, error) {
	// return an array of model.Spirit initialized with the MockedSpirit
	return []model.Spirit{MockedSpirit}, nil
}

// GetSpiritsByType returns all spirits by type
func (s *SpiritDAOMock) GetSpiritsByType(spiritType string) ([]model.Spirit, error) {
	return []model.Spirit{MockedSpirit}, nil
}

// GetSpiritsByTypeAndScore returns all spirits by type and score greater than parameter
func (s *SpiritDAOMock) GetSpiritsByTypeAndScore(spiritType string, score uint8) ([]model.Spirit, error) {
	return []model.Spirit{MockedSpirit}, nil
}

// SaveSpirit saves the spirit
func (s *SpiritDAOMock) SaveSpirit(spirit *model.Spirit) error {
	// save MockedSpirit instance with that new one
	MockedSpirit = *spirit
	return nil
}

// UpsertSpirit updates or creates a spirit
func (s *SpiritDAOMock) UpsertSpirit(ID string, spirit *model.Spirit) (bool, error) {
	MockedSpirit = *spirit
	return true, nil
}

// DeleteSpirit deletes a spirits by its ID
func (s *SpiritDAOMock) DeleteSpirit(ID string) error {
	return nil
}
