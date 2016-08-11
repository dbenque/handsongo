package dao

import (
	"github.com/Sfeir/handsongo/model"
)

// TODO initialize the MockedSpirit with a spirit of your choice

// MockedSpirit is the spirit returned by this mocked interface
var MockedSpirit model.Spirit

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
	// TODO return an array of model.Spirit initialized with the MockedSpirit
	return nil, nil
}

// GetSpiritsByName returns all spirits by name
func (s *SpiritDAOMock) GetSpiritsByName(name string) ([]model.Spirit, error) {
	// TODO return an array of model.Spirit initialized with the MockedSpirit
	return nil, nil
}

// GetSpiritsByType returns all spirits by type
func (s *SpiritDAOMock) GetSpiritsByType(spiritType string) ([]model.Spirit, error) {
	// TODO return an array of model.Spirit initialized with the MockedSpirit
	return nil, nil
}

// GetSpiritsByTypeAndScore returns all spirits by type and score greater than parameter
func (s *SpiritDAOMock) GetSpiritsByTypeAndScore(spiritType string, score uint8) ([]model.Spirit, error) {
	// TODO return an array of model.Spirit initialized with the MockedSpirit
	return nil, nil
}

// SaveSpirit saves the spirit
func (s *SpiritDAOMock) SaveSpirit(spirit *model.Spirit) error {
	// TODO bonus save MockedSpirit instance with that new one
	return nil
}

// UpsertSpirit updates or creates a spirit
func (s *SpiritDAOMock) UpsertSpirit(ID string, spirit *model.Spirit) (bool, error) {
	// TODO bonus save MockedSpirit instance with that new one
	return true, nil
}

// DeleteSpirit deletes a spirits by its ID
func (s *SpiritDAOMock) DeleteSpirit(ID string) error {
	return nil
}
