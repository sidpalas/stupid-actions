#!/bin/bash

COUNTER_FILE=./exponential/counter.txt


function increment_tag_push {
    uuid=$(uuidgen)
    suffix=$(( $count + 1 ))
    tag=$1.$uuid.$suffix
    git tag -a $tag -m "New UUID tag"
    git push origin $tag
}

count="$(echo -n $GITHUB_REF| tail -c 1)"

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
