#!/bin/bash

outFile=searchHistory

files=()
if [[ -f $outFile ]]
then
    while read -r line
    do
	files+=($line)
    done < $outFile
fi

startVal=1
total=5
if [[ $# -ge 1 ]]
then
    startVal=$1
elif [[ $# -ge 2 ]]
then
    startVal=$1
    total=$2
fi

endVal=$((startVal + $total))
endVal=$((endVal - 1))

pos=0
for i in `seq $startVal $endVal`
do
    val=$i
    if [[ $val -lt 10 ]]
    then
	val=000$val
    elif [[ $val -lt 100 ]]
    then
	val=00$val
    elif [[ $val -lt 1000 ]]
    then
	val=0$val
    fi

    isFound=0
    for j in "${files[@]}"
    do
	if [[ $j == $val ]]
	then
	    isFound=1
	    break
	fi
    done

    if [[ $isFound -eq 1 ]]
    then
	echo "\'$val\' has already been checked"
    else
	files+=($val)
    fi
    
    if [[ $pos -eq 0 ]]
    then
	firefox --new-window "https://www.youtube.com/results?search_query=img$val"
    else
	firefox --new-tab "https://www.youtube.com/results?search_query=img$val"
    fi

    pos=$((pos + 1))
done

IFS=$'\n' sortedFiles=($(sort <<<"${files[*]}"))
unset IFS

rm -f $outFile
for i in "${sortedFiles[@]}"
do    
    echo $i >> $outFile
done
