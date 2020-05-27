#!/bin/bash

COUNTER_FILE=./recursive/counter.txt

count=$(cat "$COUNTER_FILE") 
if (( $count > 5 ));
then 
    echo "Count too high... exiting";
else
    echo "Count okay... continuing";
    echo $(( $count + 1 )) > $COUNTER_FILE
    git config --global user.email "sid.palas@gmail.com"
    git config --global user.name "sid palas"
    git remote set-url origin "https://sidpalas:$PERSONAL_GITHUB_TOKEN@github.com/sidpalas/stupid-actions.git"
    git add $COUNTER_FILE
    git commit -m "Incremented counter file"
    git push 
fi; 
