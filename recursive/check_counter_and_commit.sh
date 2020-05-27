#!/bin/bash

COUNTER_FILE=./recursive/counter.txt

count=$(cat "$COUNTER_FILE") 
if (( $count > 2 ));
then 
    echo "Count too high... exiting";
else
    echo "Count okay... continuing";
    echo $(( $count + 1 )) > $COUNTER_FILE
    echo $TEST
    git config --global user.email "sid.palas@gmail.com"
    git config --global user.name "sid palas"
    git config --glocal user.password $TEST
    # git config --glocal user.password $PERSONAL_GITHUB_TOKEN
    git add $COUNTER_FILE
    git commit -m "Incremented counter file"
    git push 
fi; 
