package model

import (
	"time"

	"gopkg.in/mgo.v2/bson"
)

// SpiritType is the type of spirit as typed enumeration
type SpiritType int

const (
	// TypeRhum is the constant used for rhum spirits = 0
	TypeRhum SpiritType = iota
	// TypeWine is the constant used for wine
	TypeWine
	// TypeWhisky is the constant used for whisky
	TypeWhisky
	// TypeChampagne is the constant used for champagne
	TypeChampagne
	// TypeGin is the constant used for gin
	TypeGin
)

// Spirit is the structure to define a spirit
type Spirit struct {
	ID           bson.ObjectId `json:"id" bson:"_id,omitempty" `
	Name         string        `json:"name" bson:"name"`
	Distiller    string        `json:"distiller" bson:"distiller"`
	Bottler      string        `json:"bottler" bson:"bottler"`
	Country      string        `json:"country" bson:"country"`
	Region       string        `json:"region" bson:"region"`
	Composition  string        `json:"composition" bson:"composition"`
	SpiritType   SpiritType    `json:"type" bson:"type"`
	Age          uint8         `json:"age" bson:"age"`
	BottlingDate time.Time     `json:"bootlingDate" bson:"bootlingDate"`
	Score        float32       `json:"score" bson:"score"`
	Comment      string        `json:"comment" bson:"comment"`
}

// GetID returns the ID of an Spirit as a string
func (s *Spirit) GetID() string {
	return s.ID.Hex()
}
