#!/bin/bash

COUNTER_FILE=./exponential/counter.txt


function increment_tag_push {
    uuid=$(uuidgen)
    prefix=$(( $count + 1 ))
    tag=$prefix.$uuid.$1
    git tag -a $tag -m "GITHUB_SHA tag"
    git push origin $tag
}

count="$(echo $GITHUB_REF | head -c 1)"

echo $GITHUB_REF
echo $count

sleep 10

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
