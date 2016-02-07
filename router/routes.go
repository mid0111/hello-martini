package router

import (
	"github.com/go-martini/martini"
)

func SetupRouter(router *martini.ClassicMartini) {
	router.Get("/", func() string {
		return "Hello Martini!!"
	})
}
