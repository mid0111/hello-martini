package main

import (
	"github.com/go-martini/martini"
	"github.com/mid0111/hello-martini/router"
)

func main() {
	m := martini.Classic()
	router.SetupRouter(m)
	m.Run()
}
