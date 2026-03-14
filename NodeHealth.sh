#!/bin/bash
###################################
# Author : Brijesh
# Date : 13/03/2026
#
# This script outputs the node health
# Version 
set -x # Debug Mode 
echo "Print the disk space"
df -h
echo "Print the memory"
free -g
echo "Print the CPU"
nproc
