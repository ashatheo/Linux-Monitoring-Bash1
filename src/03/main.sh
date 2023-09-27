#!/bin/bash

source system_info.sh
source color_print.sh
source check_input.sh 


check_input "$@"
get_system_info
color_print "$@"
