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