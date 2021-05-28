answer=answers.txt
scripts=answer_scripts/*.txt
marks=marks.txt
export answer
export scripts
export marks

check_sheets() {
    echo "Checking Sheets.."
    questions=`cat $answer | grep -i "." | wc -l` #suggest alternate
    echo "Number of questions found: $questions"
    echo 
    for i in $scripts; do
        echo $i `diff $answer $i | grep -i ">" | wc -l | { read difference; echo $(($questions - $difference)); }`>> marks.txt 
    done
    sed -i -e 's/\(answer_scripts[/]\|txt\)//g' marks.txt
}

search() {
    if [ ! -z $marks ]; then
        echo "Error: No marksheet found."
        echo "Check the sheets first"
        return
    fi
    echo -en "Enter Student Roll no: "
    read roll
    echo Roll $roll got `grep -i "$roll" "$marks" | wc -l` marks
    echo
}

show_answer(){
    cat $answer
}

clean_all(){
    echo "Confirm Cleaning all data? y/n"
    read option
    if [ $option == y]; then
    rm $answer
    else
    return
    fi
}