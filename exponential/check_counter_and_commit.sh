#!/bin/bash

COUNTER_FILE=./exponential/counter.txt

function increment_commit_push {
    count=$(cat "$COUNTER_FILE") 
    echo $(( $count + 1 )) > $COUNTER_FILE
    echo incremented!
    git fetch --unshallow origin/exponential
    git add $COUNTER_FILE
    git commit -m "Incremented counter file"
    # --force required since we will encounter conflicts with parallel jobs
    git push --force
}

count=$(cat "$COUNTER_FILE") 
if (( $count > 3 ));
then 
    echo "Count too high... exiting";
else
    echo "Count okay... continuing";
    git config --global user.email "sid.palas@gmail.com"
    git config --global user.name "sid palas"
    for ((i = 1; i <= $1; i++ ));
    do
    increment_commit_push
    done
fi; 
