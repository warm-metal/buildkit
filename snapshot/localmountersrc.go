package snapshot

import (
	"io/ioutil"
	"os"
)

var localMountSourceRoot = ""

func InitLocalMountSourceRoot(snapshotRoot string) {
	localMountSourceRoot = snapshotRoot
	if err := os.MkdirAll(localMountSourceRoot, 0640); err != nil {
		panic(err)
	}
}

func MakeLocalMountSourceDir(pattern string) (name string, err error) {
	return ioutil.TempDir(localMountSourceRoot, pattern)
}
