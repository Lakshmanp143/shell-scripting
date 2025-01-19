#!/bin/bash

MSG="script1"
GREET="Hi from SCRIPT-1"
source ./17-script2.sh

echo "Hello from: $MSG"
echo "A value: $A"

#sh 17-script2.sh