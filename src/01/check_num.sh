#!/bin/bash

# проверяем, является ли введенная строка числом
check_num() {

  if [[ $1 =~ ^-?[0-9]+([.][0-9]+)$ ]]; then
    echo "N/A: Numbers"
    exit 1
  else
    echo "$1"
  fi
}
