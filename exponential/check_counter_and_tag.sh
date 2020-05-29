#!/bin/bash

COUNTER_FILE=./exponential/counter.txt

function increment_tag_push {
    git tag -a "$GITHUB_SHA.$1" -m "GITHUB_SHA tag"
    git push origin "$GITHUB_SHA.$1"
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
    increment_tag_push $i
    done
fi; 
