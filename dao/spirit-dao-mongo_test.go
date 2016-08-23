package dao

import (
	"os"
	"testing"
)

func TestDAOMongo(t *testing.T) {
	// get config
	config := os.Getenv("MONGODB_SRV")

	daoMongo, err := GetSpiritDAO(config, DAOMongo)
	if err != nil {
		t.Error(err)
	}

	// TODO create a new Spirit instance to be saved

	// TODO save the spirit with the dao
	// TODO check the error and fail the test if not nil

	// TODO log the saved spirit

	spirits, err := daoMongo.GetAllSpirits(NoPaging, NoPaging)
	if err != nil {
		t.Error(err)
	}

	t.Log("initial spirit found all", spirits[0])

	oneSpirit, err := daoMongo.GetSpiritByID(spirits[0].ID.Hex())
	if err != nil {
		t.Error(err)
	}

	t.Log("initial spirit found one", oneSpirit)

	// TODO modify Age and Comment of the spirit and Upsert it
	// TODO check the error and fail the test if not nil

	// TODO log the modified spirit

	oneSpirit, err = daoMongo.GetSpiritByID(oneSpirit.ID.Hex())
	if err != nil {
		t.Error(err)
	}

	t.Log("initial spirit found one modified", oneSpirit)

	// TODO delete the spirit
	// TODO check the error and fail the test if not nil

	// check the spirit is gone
	oneSpirit, err = daoMongo.GetSpiritByID(oneSpirit.ID.Hex())
	if err != nil {
		t.Log("initial spirit deleted", err, oneSpirit)
	}

}
