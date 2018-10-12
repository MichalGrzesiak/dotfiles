#!/usr/bin/env bash
#sets random wallpaper from ~/.wallpapers directory using wal
array=($(ls ~/.wallpapers))
wal -i ~/.wallpapers/${array[$(($RANDOM%${#array[@]}))]} 
