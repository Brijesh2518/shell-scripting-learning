#!/bin/bash
# script for printing a string in  whole parameter
# Author: Brijesh
# Date: 13/03/2026
# Version: v1

x=mississipi
grep -o "s" <<< "$x" | wc -l
