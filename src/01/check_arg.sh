#!/bin/bash

# функция для проверки аргументов
check_arg() {
  if [ $# -ne 1 ]; then
    echo "n/a > 1 arg"
    exit 1
  fi
}
