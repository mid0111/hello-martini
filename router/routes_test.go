package router

import (
	"github.com/go-martini/martini"
	"io/ioutil"
	"net/http"
	"net/http/httptest"
	"testing"
)

func ParseResponse(res *http.Response) (string, int) {
	defer res.Body.Close()
	contents, err := ioutil.ReadAll(res.Body)
	if err != nil {
		panic(err)
	}
	return string(contents), res.StatusCode
}

func Test_SerupRouter(t *testing.T) {
	m := martini.Classic()
	SetupRouter(m)

	ts := httptest.NewServer(m)
	defer ts.Close()

	res, err := http.Get(ts.URL + "/")
	if err != nil {
		t.Error("unexpected")
	}
	c, s := ParseResponse(res)
	if s != http.StatusOK {
		t.Error("invalid status code: ", s)
	}
	if c != "Hello Martini!!" {
		t.Error("invalid response: ", c)
	}
}
