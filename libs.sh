answer=answers.txt
scripts=answer_scripts/*.txt
export answer
export scripts

check_sheets() {
    echo "Checking Sheets.."
    questions=`cat $answer | grep -i "." | wc -l` #suggest alternate
    echo "Number of questions found: $questions"
    echo 
    for i in $scripts; do
        echo $i `diff $answer $i | grep -i ">" | wc -l`>> marks.txt # how to store $questions-(no. of difference)
    done
    sed -i -e 's/\(answer_scripts[/]\|txt\)//g' marks.txt
}
