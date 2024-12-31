#!/bin/bash
echo "All variables passed: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "Present working directory: $PWD"
echo "Home directory of present user: $HOME"
echo "Which user is running this script: $USER"
echo "Process id of present script: $$"
sleep 10 &
echo "Process id of last command: $!"