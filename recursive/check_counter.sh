#!/bin/bash

count=$(cat "./counter.txt") 
if (( $count > 2 ));
then 
    echo "count is greater";
else
    echo "count is less or equal";
fi; 

git status