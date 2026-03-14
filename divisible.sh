#!/bin/bash
# Divisible by 3 or 5 but not 15 in range (1-100)
# Author: Brijesh
# Date: 13/03/2026
# Version: v1

for i in {1..100}
do
    if [ $((i % 3)) -eq 0 ] || [ $((i % 5)) -eq 0 ] && [ $((i % 15)) -ne 0 ]
    then
        echo $i
    fi
done
