#!/bin/bash

source check.sh
source print.sh

# Функция для подсчета размера директории
get_dir_size() {
  local dir="$1"
  local size=0
  local du_output
  du_output=$(du -sb "$dir"/* 2>/dev/null || echo "")
  if [ -n "$du_output" ]; then
    size=$(echo "$du_output" | awk '{sum+=$1} END{print sum}')
  fi
  echo "$size"
}

# Функция для подсчета количества файлов определенного типа в директории
count_files_by_type() {
  local dir="$1"
  local extension="$2"
  local count=0
  local find_output
  find_output=$(find "$dir" -type f -name "*.$extension" 2>/dev/null || echo "")
  if [ -n "$find_output" ]; then
    count=$(echo "$find_output" | wc -l)
  fi
  echo "$count"
}

# Функция для подсчета количества символических ссылок в директории
count_symlinks() {
  local dir="$1"
  local count=0
  local find_output
  find_output=$(find "$dir" -type l 2>/dev/null || echo "")
  if [ -n "$find_output" ]; then
    count=$(echo "$find_output" | wc -l)
  fi
  echo "$count"
}

# Функция для получения списка файлов и их размеров
get_file_list_and_size() {
  local dir="$1"
  find "$dir" -type f -exec du -b {} + 2>/dev/null | sort -n -r | head -n 10
}

# Функция для получения списка исполняемых файлов и их размеров и хешей
get_executable_file_list() {
  local dir="$1"
  find "$dir" -type f -executable -exec du -b {} + 2>/dev/null | sort -n -r | head -n 10 | xargs -I {} sh -c 'echo "{} $(md5sum {} | awk "{print \$1}")"'
}


start_time=$(date +%s)
check_args "$@"
check_directory "$1"
print_directory_info "$1"
end_time=$(date +%s)
execution_time=$(echo "scale=1; ($end_time - $start_time) / 1" | bc)
echo "Script execution time (in seconds) = $execution_time"
