package dao

import (
	"testing"
)

func TestDAOMock(t *testing.T) {

	daoMongo, err := GetSpiritDAO("", DAOMock)
	if err != nil {
		t.Error(err)
	}

	// TODO save the MockedSpirit with the dao
	// TODO check the error and fail the test if not nil

	// TODO log the saved spirit

	spirits, err := daoMongo.GetAllSpirits(NoPaging, NoPaging)
	if err != nil {
		t.Error(err)
	}

	t.Log("initial spirit found ", spirits[0])

	oneSpirit, err := daoMongo.GetSpiritByID(spirits[0].GetID())
	if err != nil {
		t.Error(err)
	}

	t.Log("initial spirit found one", oneSpirit)

	// TODO modify Age and/or Comment of the spirit and Upsert it
	// TODO check the error and fail the test if not nil

	// TODO log the modified spirit

	oneSpirit, err = daoMongo.GetSpiritByID(oneSpirit.GetID())
	if err != nil {
		t.Error(err)
	}

	t.Log("initial spirit found modified", oneSpirit)

}
