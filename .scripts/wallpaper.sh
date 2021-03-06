#!/usr/bin/env bash
#sets random wallpaper from ~/.wallpapers directory using wal

file="./.transparency_level"
array=($(ls ~/.wallpapers))

if [ -f "$file" ]
then
	transparency_level=$(head -n 1 $file)
else
	touch .transparency_level
	transparency_level=100
fi

wal -i  ~/.wallpapers/${array[$(($RANDOM%${#array[@]}))]} -a $transparency_level

echo $transparency_level >.transparency_level
