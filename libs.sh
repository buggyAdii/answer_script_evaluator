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
        echo $i `diff $answer $i | grep -i ">" | wc -l | { read difference; echo $(($questions - $difference)); }` >> marks.txt 
    done
    sed -i -e 's/\(answer_scripts[/]\|txt\)//g' marks.txt
    echo
    echo "Marksheet is ready.."
    sleep 1
}

search() {
    if [ ! -f $marks ]; then
        echo "Error: No marksheet found."
        echo "Check the sheets first"
        sleep 1
        return
    fi
    echo -en "Enter Student Roll no: "
    read roll
    points=`grep -i "${roll}." $marks | cut -d "." -f2`
    if [ ! -z $points ]; then
        echo
        echo  "Roll $roll got${points} marks."
        sleep 1
    else
        echo "Error: Marks/Student not found."
        sleep 1
    fi
}

show_answer(){
    cat $answer
    sleep 1
}

clean_all(){
    echo "Confirm Cleaning all data? y/n"
    read option
    if [ $option == y]; then
    rm $answer
    echo "Clean Successfull"
    sleep 1
    else
    return
    fi
}