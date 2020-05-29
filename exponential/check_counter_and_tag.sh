#!/bin/bash

COUNTER_FILE=./exponential/counter.txt

function increment_tag_push {
    uuid=$(uuidgen)
    git tag -a $uuid -m "GITHUB_SHA tag"
    git push origin $uuid
}

count=$(cat "$COUNTER_FILE") 

sleep 5

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
