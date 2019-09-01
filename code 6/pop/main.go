package main

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"strings"
)

const argMin = 3

func main() {
	// check if min args are present
	if len(os.Args) != argMin+1 {
		fmt.Fprintf(os.Stderr, "This commad requires exactly %d parameters, %d given.\n", argMin, len(os.Args)-1)
		os.Exit(1)
	}

	// parse args
	varsArr := strings.Split(os.Args[1], ",")
	dirs := strings.Split(os.Args[2], ",")
	out := strings.Split(os.Args[3], ",")
	if len(dirs) != len(out) {
		fmt.Fprintf(os.Stderr, "The number of input directores (%d) does not match the number of output directories (%d) given.\n", len(dirs), len(out))
		os.Exit(1)
	}

	// parse vars into map
	vars := make(map[string]string)
	for i, v := range varsArr {
		sa := strings.Split(v, "=")
		if len(sa) != 2 {
			fmt.Fprintf(os.Stderr, "Invalid key value pairs in variables %s at index %d \n", os.Args[1], i)
			os.Exit(1)
		}
		key, value := strings.TrimSpace(sa[0]), strings.TrimSpace(sa[1])
		vars[key] = value
	}

	// loop through dirs slice to execute
	for i, d := range dirs {
		d := filepath.Clean(d)
		execute(d, out[i], vars)
	}
}

func execute(dir, out string, vars map[string]string) {
	fmt.Printf("Executing %s ...\n", dir)
	if !isValidDir(dir) {
		fmt.Fprintf(os.Stderr, "Directory not found at path %s\n", dir)
		os.Exit(1)
	}

	// create out directory if it does not exist
	if !isValidDir(out) {
		err := os.MkdirAll(out, os.FileMode(int(0777)))
		if err != nil {
			fmt.Fprintf(os.Stderr, "Error creating output directory %s, %s\n", out, err.Error())
			os.Exit(1)
		}
	}

	// get a list of files in the source directory
	files, err := ioutil.ReadDir(dir)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error getting files from directory %s\n", dir)
		os.Exit(1)
	}
	if len(files) == 0 {
		fmt.Fprintf(os.Stderr, "No files present in directory %s\n", dir)
		os.Exit(1)
	}

	// loop through files and populate
	for _, file := range files {
		// form sourcefile path
		fp := filepath.Join(dir, file.Name())

		// get file contents
		b, err := ioutil.ReadFile(fp)
		if err != nil {
			fmt.Fprintf(os.Stderr, "Error reading file %s\n", fp)
			os.Exit(1)
		}

		// add vars to file
		for k, v := range vars {
			b = bytes.Replace(b, []byte("{{"+k+"}}"), []byte(v), -1)
		}
		// form out filepath
		op := filepath.Join(out, file.Name())
		// add contents to out file
		err = ioutil.WriteFile(op, b, 0744)
		if err != nil {
			fmt.Fprintf(os.Stderr, "Error writing to file %s\n", op)
			os.Exit(1)
		}
	}
}

func isValidDir(dir string) bool {
	fi, err := os.Stat(dir)
	if err != nil {
		return false
	}

	if !fi.IsDir() {
		return false
	}
	return true
}
