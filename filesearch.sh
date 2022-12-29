#!/bin/bash
echo "Enter the linux directory path to search"
read path
        if [ ! -d "$path" ]
        then
            echo "Directory $path  DOES NOT exists."
            exit 1
        fi

echo "Please enter the start date in the format YYYYMMDD"
read strtdt

echo "please enter the end date in the format YYYYMMDD"
read enddt

touch -t ${strtdt}0000 /tmp/newerstart
touch -t ${enddt}2359 /tmp/newerend
echo "Below are the list of files as per directory and dates entered "
echo "-----------------------------------------------------------"
find $path \( -newer /tmp/newerstart -a \! -newer /tmp/newerend \) -exec ls -l {} \;
