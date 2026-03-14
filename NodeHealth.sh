#!/bin/bash
###################################
# Author : Brijesh
# Date : 13/03/2026
#
# This script outputs the node health
# Version 
# Set -x "Dubug Mode"
# set -e "Exit the script when there is error occure"
# set -o "pipefial"
echo "Print the disk space"
df -h
echo "Print the memory"
free -g
echo "Print the CPU"
nproc

echo "Print the Specific Process"
ps -ef  

