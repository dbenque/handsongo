package model

import (
	"gopkg.in/mgo.v2/bson"
	"testing"
)

func TestSpiritGetID(t *testing.T) {

	spirit := Spirit{
		ID:   bson.NewObjectId(),
		Name: "test",
	}

	if len(spirit.GetID()) == 0 {
		t.Error("wrong object ID definition")
	}

}
