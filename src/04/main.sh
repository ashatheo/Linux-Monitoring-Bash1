#!/bin/bash

source system_info.sh
source color_print.sh

# Получаем системную информацию
get_system_info

# Проверяем наличие и читаем конфигурационный файл
if [ -f color.config ]; then
  source color.config
  
  #Проверка что диапазон цветов от 0-6
    if (($column1_background < 1 || $column1_background > 6)); then
  column1_background=0
    fi

    if (($column1_font_color < 1 || $column1_font_color > 6)); then
  column1_font_color=7
    fi

  if (($column2_background < 1 || $column2_background > 6)); then
  column2_background=0
  fi

  if (($column2_font_color < 1 || $column2_font_color > 6)); then
  column2_font_color=7
  fi

else
  # Если конфигурационный файл отсутствует, задаем значения по умолчанию
  column1_background=0
  column1_font_color=7
  column2_background=0
  column2_font_color=7
fi

# Выводим информацию в заданных цветах
color_print "$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color"

# Выводим цветовую схему
print_color_scheme
