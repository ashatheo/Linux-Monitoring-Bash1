#!/bin/bash

# функция для вывода информации в указанных цветах
color_print() {
  local bg_name1=$1
  local fg_name1=$2
  local bg_name2=$3
  local fg_name2=$4

  # задаем цвета ANSI для фона и шрифта
  local bg_color1=""
  local fg_color1=""
  local bg_color2=""
  local fg_color2=""

  case $bg_name1 in
    1) bg_color1="\e[47m" ;;  # White background
    2) bg_color1="\e[41m" ;;  # Red background
    3) bg_color1="\e[42m" ;;  # Green background
    4) bg_color1="\e[44m" ;;  # Blue background
    5) bg_color1="\e[45m" ;;  # Purple background
    6) bg_color1="\e[40m" ;;  # Black background
    0) bg_color1="\e[40m" ;;  # Default background
  esac

  case $fg_name1 in
    1) fg_color1="\e[97m" ;;  # White foreground
    2) fg_color1="\e[91m" ;;  # Red foreground
    3) fg_color1="\e[92m" ;;  # Green foreground
    4) fg_color1="\e[94m" ;;  # Blue foreground
    5) fg_color1="\e[95m" ;;  # Purple foreground
    6) fg_color1="\e[30m" ;;  # Black foreground
    7) bg_color1="\e[97m" ;;  # Default background
  esac

  case $bg_name2 in
    1) bg_color2="\e[47m" ;;  # White background
    2) bg_color2="\e[41m" ;;  # Red background
    3) bg_color2="\e[42m" ;;  # Green background
    4) bg_color2="\e[44m" ;;  # Blue background
    5) bg_color2="\e[45m" ;;  # Purple background
    6) bg_color2="\e[40m" ;;  # Black background
    0) bg_color1="\e[40m" ;;  # Default background
  esac

  case $fg_name2 in
    1) fg_color2="\e[97m" ;;  # White foreground
    2) fg_color2="\e[91m" ;;  # Red foreground
    3) fg_color2="\e[92m" ;;  # Green foreground
    4) fg_color2="\e[94m" ;;  # Blue foreground
    5) fg_color2="\e[95m" ;;  # Purple foreground
    6) bg_color2="\e[40m" ;;  # Black background
    7) bg_color1="\e[97m" ;;  # Default background
  esac

  # Объединяем цвета в одну переменную
  local color1="${bg_color1}${fg_color1}"
  local color2="${bg_color2}${fg_color2}"

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
  echo
}

# Функция для вывода цветовой схемы
print_color_scheme() {
  echo "Column 1 background = $column1_background ($(get_color_name $column1_background))"
  echo "Column 1 font color = $column1_font_color ($(get_color_name $column1_font_color))"
  echo "Column 2 background = $column2_background ($(get_color_name $column2_background))"
  echo "Column 2 font color = $column2_font_color ($(get_color_name $column2_font_color))"
}

print_color_scheme_default() {
  echo "Column 1 background = $column1_background "
  echo "Column 1 font color = $column1_font_color "
  echo "Column 2 background = $column2_background "
  echo "Column 2 font color = $column2_font_color "
}

# Функция для получения имени цвета по его номеру
get_color_name() {
  case $1 in
    1) echo "white" ;;
    2) echo "red" ;;
    3) echo "green" ;;
    4) echo "blue" ;;
    5) echo "purple" ;;
    6) echo "black" ;;
    7) echo "default white" ;;
    0) echo "default black" ;;
  esac
}
