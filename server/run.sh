#!/bin/sh

if [[ -n "$EULA" ]]; then
     echo "eula=$EULA" > eula.txt;
fi

java -jar $@
