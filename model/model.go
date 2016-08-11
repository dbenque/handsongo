package model

import (
	"gopkg.in/mgo.v2/bson"
)

const (
	// TypeRhum is the constant used for rhum spirits
	TypeRhum = "rhum"
	// TypeWhine is the constant used for rhum spirits
	TypeWhine = "wine"
	// TypeBeer is the constant used for rhum spirits
	TypeBeer = "beer"
	// TypeCalados is the constant used for rhum spirits
	TypeCalados = "calvados"
	// TypeChampagne is the constant used for rhum spirits
	TypeChampagne = "champagne"
	// TypeGin is the constant used for rhum spirits
	TypeGin = "gin"
)

// Spirit is the structure to define a spirit
type Spirit struct {
	ID bson.ObjectId `json:"id" bson:"_id,omitempty" `
	// TODO add a string Name attribute
	// TODO add a string Distiller attribute
	// TODO add a string Bottler attribute
	// TODO add a string Country attribute
	// TODO add a string Region attribute
	Composition string `json:"composition" bson:"composition"`
	SpiritType  string `json:"type" bson:"type"`
	// TODO add an uint8 Age attribute
	// TODO add a time BottlingDate aatribute
	Score   float32 `json:"score" bson:"score"`
	Comment string  `json:"comment" bson:"comment"`
}

// GetID returns the ID of an Spirit as a string
func (s *Spirit) GetID() string {
	return s.ID.Hex()
}
