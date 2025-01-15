#!/bin/bash

echo "all variables passed:$@"
echo "number of variables passed:$#"
echo "present script name:$0"
echo "process id od present script:$$"
ls -ltr
echo "process id of previous command:$!"
echo "present working directory:$PWD"
echo "home directory of current user:$HOME" 
echo "which user execute this script:$USER" 