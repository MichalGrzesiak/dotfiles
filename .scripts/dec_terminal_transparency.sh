#!/usr/bin/env bash
#Script decreases termianl transparency

file="./.transparency_level"
if [ -f "$file" ]
then
	transparency_level=$(head -n 1 $file)
else
	touch .transparency_level
	transparency_level=100
fi

if [ $transparency_level -lt 100 ]; then
	transparency_level=$((transparency_level+=10))
fi

wal -R -a $transparency_level

echo $transparency_level >.transparency_level
