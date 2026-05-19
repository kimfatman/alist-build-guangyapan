package internal

import (
	log "github.com/sirupsen/logrus"
)

type MyFormatter struct {
	OnLog func(entry *log.Entry)
}

func (f *MyFormatter) Format(entry *log.Entry) ([]byte, error) {
	f.OnLog(entry)
	return []byte{}, nil
}