#!/bin/bash

create_directory(){
	mkdir "demodir"
}

if ! create_directory; then
	echo "Failed to create directory. Directory already exists!"
	exit 1
fi

echo "Directory created successfully"

