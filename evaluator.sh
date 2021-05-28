#!/bin/bash

# answer script evaluator
# Author : Aditya Prakash

. ./libs.sh
menu() {
    while [ "$i" != "q" ]; do
        echo; echo; 
        echo "----- answer script evaluator -----"
        echo "1. Check Sheets"
        echo "2. Search Student marks"
        echo "3. Show answers"
        echo "4. Clean all"
        echo "q. quit"
        echo "-------------------------"
        echo -en "Enter your selection: "
        read i
        case $i in
        "1")
        rm -rf marks.txt
        check_sheets
        ;;
        "2")
        search
        ;;
        "3")
        show_answer
        ;;
        "4")
        clean_all
        ;;
        "q")
        echo "Quitting"
        exit 0
        ;;
        *)
        echo "Unexpected input"
        ;;
        esac
    done
}

echo "Checking answer script...."
if [ ! -f $answer ]; then
    echo "answer script doesn't exist.."
    echo "Please include answer script."
    sleep 2
fi

if [ ! -r $answer ]; then
    echo "Error: $answer not readable"
    sleep 2
    exit 1
fi
echo "Answer script found."
menu