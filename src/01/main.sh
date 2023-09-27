#!/bin/bash

source check_arg.sh
source check_num.sh


check_arg "$@" #передаем все аргументы командной строки
check_num "$@" #аналогично
