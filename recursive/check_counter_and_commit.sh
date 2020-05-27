#!/bin/bash

COUNTER_FILE=./recursive/counter.txt

count=$(cat "$COUNTER_FILE") 
if (( $count > 2 ));
then 
    echo "Count too high... exiting";
else
    echo "Count okay... continuing";
    echo $(( $count + 1 )) > $COUNTER_FILE
    git config --global user.email "github.action@gmail.com"
    git config --global user.name "mr. action"
    git add $COUNTER_FILE
    git commit -m "Incremented counter file"
    git push 
fi; 