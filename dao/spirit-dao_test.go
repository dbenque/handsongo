package dao

import (
	"testing"
)

func TestDAOMock(t *testing.T) {

	daoMongo, err := GetSpiritDAO("", DAOMock)
	if err != nil {
		t.Error(err)
	}

	err = daoMongo.SaveSpirit(&MockedSpirit)

	if err != nil {
		t.Error("unable to save spirit", err)
	}

	t.Log("spirit saved", MockedSpirit)

	spirits, err := daoMongo.GetAllSpirits(NoPaging, NoPaging)
	if err != nil {
		t.Error(err)
	}

	t.Log("initial spirit found", spirits[0])

	oneSpirit, err := daoMongo.GetSpiritByID(spirits[0].GetID())
	if err != nil {
		t.Error(err)
	}

	t.Log("initial spirit found one", oneSpirit)

	// update spirit
	oneSpirit.Score = 9.0
	oneSpirit.Comment = "soft tarmac smell"

	chg, err := daoMongo.UpsertSpirit(oneSpirit.ID.Hex(), oneSpirit)
	if err != nil {
		t.Error(err)
	}

	t.Log("initial spirit modified", chg, oneSpirit)

	oneSpirit, err = daoMongo.GetSpiritByID(oneSpirit.GetID())
	if err != nil {
		t.Error(err)
	}

	t.Log("initial spirit found modified", oneSpirit)

}
