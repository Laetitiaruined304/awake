package main

import (
	_ "embed"

	"github.com/VolksRat71/awake/cmd"
	"github.com/VolksRat71/awake/engine"
)

//go:embed assets/icon-transparent.png
var iconData []byte

func main() {
	engine.EnsureIcon(iconData)
	cmd.Execute()
}
