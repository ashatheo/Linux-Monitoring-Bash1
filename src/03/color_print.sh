#!/bin/bash

# функция для вывода информации в указанных цветах
color_print() {
  bg_name1=$1
  fg_name1=$2
  bg_name2=$3
  fg_name2=$4

  # задаем цвета ANSI для фона и шрифта
  bg_color1=""
  fg_color1=""
  bg_color2=""
  fg_color2=""

  case $bg_name1 in
    1) bg_color1="\e[47m" ;;  # White background
    2) bg_color1="\e[41m" ;;  # Red background
    3) bg_color1="\e[42m" ;;  # Green background
    4) bg_color1="\e[44m" ;;  # Blue background
    5) bg_color1="\e[45m" ;;  # Purple background
    6) bg_color1="\e[40m" ;;  # Black background
  esac

  case $fg_name1 in
    1) fg_color1="\e[97m" ;;  # White foreground
    2) fg_color1="\e[91m" ;;  # Red foreground
    3) fg_color1="\e[92m" ;;  # Green foreground
    4) fg_color1="\e[94m" ;;  # Blue foreground
    5) fg_color1="\e[95m" ;;  # Purple foreground
    6) fg_color1="\e[30m" ;;  # Black foreground
  esac

  case $bg_name2 in
    1) bg_color2="\e[47m" ;;  # White background
    2) bg_color2="\e[41m" ;;  # Red background
    3) bg_color2="\e[42m" ;;  # Green background
    4) bg_color2="\e[44m" ;;  # Blue background
    5) bg_color2="\e[45m" ;;  # Purple background
    6) bg_color2="\e[40m" ;;  # Black background
  esac

  case $fg_name2 in
    1) fg_color2="\e[97m" ;;  # White foreground
    2) fg_color2="\e[91m" ;;  # Red foreground
    3) fg_color2="\e[92m" ;;  # Green foreground
    4) fg_color2="\e[94m" ;;  # Blue foreground
    5) fg_color2="\e[95m" ;;  # Purple foreground
    6) fg_color2="\e[30m" ;;  # Black foreground
  esac

  # Объединяем цвета в одну переменную
  color1="${bg_color1}${fg_color1}"
  color2="${bg_color2}${fg_color2}"

  # Выводим информацию в заданных цветах
  echo -e "${color1}HOSTNAME = ${color2}${HOSTNAME}\e[0m"
  echo -e "${color1}TIMEZONE = ${color2}${TIMEZONE}\e[0m"
  echo -e "${color1}USER = ${color2}${USER}\e[0m"
  echo -e "${color1}OS = ${color2}${OS}\e[0m"
  echo -e "${color1}DATE = ${color2}${DATE}\e[0m"
  echo -e "${color1}UPTIME = ${color2}${UPTIME}\e[0m"
  echo -e "${color1}UPTIME_SEC = ${color2}${UPTIME_SEC}\e[0m"
  echo -e "${color1}IP = ${color2}${IP}\e[0m"
  echo -e "${color1}MASK = ${color2}${MASK}\e[0m"
  echo -e "${color1}GATEWAY = ${color2}${GATEWAY}\e[0m"
  echo -e "${color1}RAM_TOTAL = ${color2}${RAM_TOTAL}\e[0m"
  echo -e "${color1}RAM_USED = ${color2}${RAM_USED}\e[0m"
  echo -e "${color1}RAM_FREE = ${color2}${RAM_FREE}\e[0m"
  echo -e "${color1}SPACE_ROOT = ${color2}${SPACE_ROOT}\e[0m"
  echo -e "${color1}SPACE_ROOT_USED = ${color2}${SPACE_ROOT_USED}\e[0m"
  echo -e "${color1}SPACE_ROOT_FREE = ${color2}${SPACE_ROOT_FREE}\e[0m"
}
